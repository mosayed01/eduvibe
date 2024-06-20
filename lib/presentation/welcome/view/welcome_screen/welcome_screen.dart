import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/primary_button.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.iconWelcome,
              width: 1.sw,
              fit: BoxFit.contain,
            ),
            verticalSpacer(60),
             Text(
              'Welcome to Eduvibe',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: getOnBackground87(context),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              width: 0.8.sw,
              onPressed: () {
                Navigator.pushNamed(context, Routes.loginScreen);
              },
              text: 'Login',
            ),
            verticalSpacer(16),
            PrimaryButton(
              width: 0.8.sw,
              onPressed: () {
                Navigator.pushNamed(context, Routes.mainScreen);
              },
              text: 'As gust',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
