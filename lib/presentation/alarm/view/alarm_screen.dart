import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/presentation/alarm/view/widgets/body_alarm.dart';
import 'package:eduvibe/presentation/alarm/view/widgets/body_stopwatch.dart';
import 'package:eduvibe/presentation/alarm/view/widgets/body_timer.dart';
import 'package:eduvibe/presentation/alarm/view/widgets/selector_section.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/appbar.dart';
import '../../../generated/l10n.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  var _selected = 0;
  final _screens = const [AlarmBody(), StopwatchBody(), TimerBody()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: AppLocalizations.current.alarm,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        verticalSpacer(16),
        SelectorSection(
          onSelectChanged: (index) {
            setState(() {
              _selected = index;
            });
          },
        ),
        verticalSpacer(24),
        Expanded(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _screens[_selected]),
        ),
      ],
    );
  }
}
