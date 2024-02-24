import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/primary_button.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/widget/dot_indicator.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/widget/model.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/widget/onboarding_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/route/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: double.infinity,
          leading: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.welcomeScreen);
                },
                child: Text(
                  AppLocalizations.current.skip,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDarkMode
                        ? EVColors.onBackground60Dark
                        : EVColors.onBackground60Light,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          )
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnBoardingItem(onBoardItem: onboardingData[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onboardingData.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PrimaryButton(
                width: 140.w,
                text: AppLocalizations.current.next,
                onPressed: () {
                  if (_pageIndex == onboardingData.length - 1) {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.welcomeScreen);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
            verticalSpacer(50),
          ],
        ),
      ),
    );
  }
}
