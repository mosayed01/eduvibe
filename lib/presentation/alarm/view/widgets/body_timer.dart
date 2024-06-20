import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/ev_colors.dart';

class TimerBody extends StatefulWidget {
  const TimerBody({super.key});

  @override
  State<TimerBody> createState() => _TimerBodyState();
}

class _TimerBodyState extends State<TimerBody> {
  var _seconds = 0;
  var _minutes = 0;
  var _hours = 0;
  StreamSubscription? _job;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RichText(
          text: TextSpan(
            text: '${_hours.toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: EVColors.primaryLight,
                ),
            children: [
              TextSpan(
                text: ':${_minutes.toString().padLeft(2, '0')}',
              ),
              TextSpan(
                text: ':${_seconds.toString().padLeft(2, '0')}',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeInput('HH', _hours, (value) {
              setState(() {
                _hours = int.tryParse(value) ?? 0;
              });
            }),
            _buildTimeInput('MM', _minutes, (value) {
              setState(() {
                _minutes = int.tryParse(value) ?? 0;
              });
            }),
            _buildTimeInput('SS', _seconds, (value) {
              setState(() {
                _seconds = int.tryParse(value) ?? 0;
              });
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                var duration = Duration(
                  hours: _hours,
                  minutes: _minutes,
                  seconds: _seconds,
                );

                if(duration.inSeconds == 0 || _job != null) return;
                _job = Stream.fromFuture(Future.doWhile(
                  () async {
                    if (duration.inSeconds == 0) {
                      _job?.cancel();
                    } else {
                      setState(() {
                        duration -= const Duration(seconds: 1);
                        _hours = duration.inHours;
                        _minutes = duration.inMinutes.remainder(60);
                        _seconds = duration.inSeconds.remainder(60);
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      return true;
                    }
                    _job?.cancel();
                    _job = null;
                    return false;
                  },
                )).listen((event) {});
              },
              child: Text('Start'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeInput(
      String label, int value, void Function(String) onChanged) {
    return Container(
      width: 100.w,
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: EVColors.primaryLight,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: EVColors.primaryLight,
            ),
          ),
        ),
      ),
    );
  }
}
