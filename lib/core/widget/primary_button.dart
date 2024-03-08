import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35.r)),
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: textColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
