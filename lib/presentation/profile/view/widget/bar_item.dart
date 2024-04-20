import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

class BarItem extends StatefulWidget {
  final String title;
  final double value;

  BarItem({required this.title, required this.value});

  @override
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.value).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 30.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.w),
                  topRight: Radius.circular(4.w),
                ),
                color: getOnBackground16(context),
              ),
            ),
            Container(
              width: 30.w,
              height: (200 * _animation.value).h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.w),
                  topRight: Radius.circular(4.w),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        verticalSpacer(24),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
