import 'package:eduvibe/core/route/page_wrapper.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/presentation/main/main_screen/main_screen.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:eduvibe/presentation/welcome/view/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

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
      default:
        return wrapWithPage(child: WelcomeScreen());
    }
  }
}
