import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopwatchBody extends StatefulWidget {
  const StopwatchBody({super.key});

  @override
  State<StopwatchBody> createState() => _StopwatchBodyState();
}

class _StopwatchBodyState extends State<StopwatchBody> {
  final _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      if (_stopwatch.isRunning) {
        setState(() {});
      }
      await Future.delayed(const Duration(seconds: 1));
      return true;
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 3.w,
            ),
            borderRadius: BorderRadius.circular(150.w),
          ),
          width: 200.w,
          height: 200.w,
          alignment: Alignment.center,
          child: Text(_stopwatch.elapsed.toString().split('.')[0],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: getOnBackground87(context),
                  )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                _stopwatch.reset();
                setState(() {});
              },
              icon: Icon(
                Icons.stop,
                color: getOnBackground87(context),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  if (_stopwatch.isRunning) {
                    _stopwatch.stop();
                  } else {
                    _stopwatch.start();
                  }
                  setState(() {});
                },
                icon: Icon(
                  _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(
              width: 48.w,
            )
          ],
        ),
      ],
    );
  }
}
