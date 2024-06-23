import 'package:eduvibe/core/route/page_wrapper.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/presentation/Calculator/caculator/calculator_screen.dart';
import 'package:eduvibe/presentation/booksDetails/booksDetailsScreen.dart';
import 'package:eduvibe/presentation/chatbot/cubit/chatbot_cubit.dart';
import 'package:eduvibe/presentation/chatbot/view/chatbot.dart';
import 'package:eduvibe/presentation/courses/courses_screen.dart';
import 'package:eduvibe/presentation/forgotPassword/forgotPassword_screen/forgotPassword_screen.dart';
import 'package:eduvibe/presentation/login/login_screen/login_screen.dart';
import 'package:eduvibe/presentation/main/main_screen/main_screen.dart';
import 'package:eduvibe/presentation/notifications/notifications.dart';
import 'package:eduvibe/presentation/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:eduvibe/presentation/otp/otp_screen/otp_screen.dart';
import 'package:eduvibe/presentation/profile/view/profile_screen.dart';
import 'package:eduvibe/presentation/splash/splash_screen/splash_screen.dart';
import 'package:eduvibe/presentation/strategies/study_strartegies.dart';
import 'package:eduvibe/presentation/welcome/view/welcome_screen/welcome_screen.dart';
import 'package:eduvibe/settings/notifications_settings/notifications_settings.dart';
import 'package:eduvibe/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/Notes/notes/view/home/home_view.dart';
import '../../presentation/alarm/view/alarm_screen.dart';
import '../../presentation/courseDetails/courseDetailsScreen.dart';
import '../../presentation/learn/learn_screen.dart';
import '../../presentation/profile/cubit/profile_cubit.dart';
import '../../presentation/register/register_screen/register_screen.dart';
import '../../presentation/resetPassword/resetPassword_screen/resetPassword_screen.dart';
import '../di/di.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return wrapWithPage(child: WelcomeScreen());
      case Routes.splashScreen:
        return wrapWithPage(child: SplashScreen());
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
      case Routes.addNoteScreen:
        return wrapWithPage(child: NoteScreen());
      case Routes.profileScreen:
        return wrapWithPage(
            child: BlocProvider(
          create: (context) => getIt<ProfileCubit>()..getProfile(),
          child: ProfileScreen(),
        ));
      case Routes.alarmScreen:
        return wrapWithPage(child: AlarmScreen());
      case Routes.learnScreen:
        return wrapWithPage(child: LearnScreen());
      case Routes.coursesScreen:
        return wrapWithPage(child: GridImageCourse());
      case Routes.notificationsScreen:
        return wrapWithPage(child: NotificationScreen());
      case Routes.strategiesScreen:
        return wrapWithPage(child: StudyStrategiesScreen());
      case Routes.settingsScreen:
        return wrapWithPage(child: SettingsScreen());
      case Routes.notificationsSettingsScreen:
        return wrapWithPage(child: NotificationsSettingsScreen());
      case Routes.courseDetailsScreen:
        return wrapWithPage(child: CourseDetailsScreen());
      case Routes.courseDetailsScreen:
        return wrapWithPage(child: BooksDetailsScreen());
      case Routes.calculatorScreen:
        return wrapWithPage(child: Calculator());
      case Routes.chatBotScreen:
        return wrapWithPage(
            child: BlocProvider(
          create: (context) => getIt<ChatbotCubit>(),
          child: ChatbotScreen(),
        ));
      default:
        return wrapWithPage(child: MainScreen());
    }
  }
}
