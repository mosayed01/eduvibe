import 'package:eduvibe/core/route/page_wrapper.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/presentation/forgotPassword/forgotPassword_screen/forgotPassword_screen.dart';
import 'package:eduvibe/presentation/login/login_screen/login_screen.dart';
import 'package:eduvibe/presentation/main/main_screen/main_screen.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:eduvibe/presentation/otp/otp_screen/otp_screen.dart';
import 'package:eduvibe/presentation/welcome/view/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/register/register_screen/register_screen.dart';
import '../../presentation/resetPassword/resetPassword_screen/resetPassword_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return wrapWithPage(child: WelcomeScreen());
      case Routes.onBoardingScreen:
        return wrapWithPage(child: OnboardingScreen());
      case Routes.mainScreen:
        return wrapWithPage(child: MainScreen());
      case Routes.signUpScreen:
        return wrapWithPage(child: SignUpScreen());
      case Routes.loginScreen:
        return wrapWithPage(child: LoginScreen());
      case Routes.forgetPasswordScreen:
        return wrapWithPage(child: ForgotPasswordScreen());
      case Routes.otpScreen:
        return wrapWithPage(child: OTPScreen());
      case Routes.resetPasswordScreen:
        return wrapWithPage(child: ResetPasswordScreen());
      default:
        return wrapWithPage(child: WelcomeScreen());
    }
  }
}
