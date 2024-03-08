import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : isDarkMode
            ? EVColors.onBackground16Dark
            : EVColors.onBackground16Light;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.h,
      width: isActive ? 40.h : 10.h,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
    );
  }
}
