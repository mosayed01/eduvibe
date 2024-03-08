import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/widget/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardItem});

  final OnBoard onBoardItem;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            onBoardItem.imagePath,
            width: 320.w,
            height: 290.h,
            fit: BoxFit.cover,
          ),
          verticalSpacer(16),
          Text(
            onBoardItem.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDarkMode
                    ? EVColors.onBackground87Dark
                    : EVColors.onBackground87Light),
            textAlign: TextAlign.center,
          ),
          verticalSpacer(16),
          Text(
            onBoardItem.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDarkMode
                      ? EVColors.onBackground60Dark
                      : EVColors.onBackground60Light,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
