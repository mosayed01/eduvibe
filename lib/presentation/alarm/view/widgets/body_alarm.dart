import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmBody extends StatefulWidget {
  const AlarmBody({super.key});

  @override
  State<AlarmBody> createState() => _AlarmBodyState();
}

class _AlarmBodyState extends State<AlarmBody> {
  late List<AlarmSettings> alarms;

  @override
  void initState() {
    super.initState();
    if (Alarm.android) {
      checkAndroidNotificationPermission();
      checkAndroidScheduleExactAlarmPermission();
    }
    loadAlarms();
  }

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> checkAndroidNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      alarmPrint('Requesting notification permission...');
      final res = await Permission.notification.request();
      alarmPrint(
        'Notification permission ${res.isGranted ? '' : 'not '}granted',
      );
    }
  }

  Future<void> checkAndroidExternalStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      alarmPrint('Requesting external storage permission...');
      final res = await Permission.storage.request();
      alarmPrint(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    alarmPrint('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      alarmPrint('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      alarmPrint(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return alarms.isEmpty
        ? const Text('No alarms')
        : ListView.builder(
      shrinkWrap: true,
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        final alarm = alarms[index];
        final day = alarm.dateTime.day == DateTime
            .now()
            .day
            ? 'Today'
            : alarm.dateTime.day == DateTime
            .now()
            .day + 1
            ? 'Tomorrow'
            : alarm.dateTime.day.toString();
        final time =
            '${alarm.dateTime.hour % 12}:${alarm.dateTime.minute}';
        final amPm = alarm.dateTime.hour > 12 ? 'PM' : 'AM';
        return ListTile(
          dense: true,
          title: RichText(
            text: TextSpan(
              text: '$time',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                color: getOnBackground87(context),
              ),
              children: [
                TextSpan(
                  text: ' $amPm',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                    color: getOnBackground60(context),
                  ),
                ),
              ],
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: '${alarm.notificationTitle}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                color: getOnBackground60(context),
              ),
              children: [
                TextSpan(
                  text: ' - $day',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: getOnBackground60(context),
                  ),
                ),
              ],
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final result = await Alarm.stop(alarm.id);
              debugPrint('Alarm stop: ${result ? 'success' : 'failure'}');
              loadAlarms();
            },
          ),
        );
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // open date picker dialog
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        // show time picker dialog
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        // open text input dialog
        final title = await showDialog<String>(
          context: context,
          builder: (context) {
            final TextEditingController controller = TextEditingController();
            return AlertDialog(
              title: const Text('Alarm title'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter alarm title',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, controller.text);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        if(date == null || time == null) return;
        final alarm = AlarmSettings(
          enableNotificationOnKill: false,
          vibrate: true,
          dateTime: DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          ),
          notificationTitle: title ?? 'Alarm',
          id: int.parse(DateTime.now().millisecondsSinceEpoch.toString().substring(8)),
          assetAudioPath: '',
          notificationBody: '',
        );
        final result = await Alarm.set(alarmSettings: alarm);
        debugPrint('Alarm set: ${result ? 'success' : 'failure'}');
        loadAlarms();
      },
      child: const Icon(Icons.add),
    );
  }
}
