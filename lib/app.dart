import 'package:eduvibe/core/route/app_router.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.isFirstTime,
  });

  final bool isLoggedIn;
  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navigateKey,
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(Brightness.light),
      darkTheme: buildDarkTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      initialRoute: isLoggedIn
          ? Routes.mainScreen
          : isFirstTime
              ? Routes.onBoardingScreen
              : Routes.welcomeScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

//
// @override
// Widget build(BuildContext context) {
//   return ScreenUtilInit(
//     designSize: const Size(393, 852),
//     minTextAdapt: true,
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       navigatorKey: AppRouter.navigateKey,
//       locale: const Locale('ar'),
//       supportedLocales: const [
//         Locale('ar'),
//       ],
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       theme: ThemeData(
//         textTheme: GoogleFonts.cairoTextTheme(),
//         scaffoldBackgroundColor: GascoColors.white,
//         appBarTheme: const AppBarTheme(
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarIconBrightness: Brightness.dark,
//             statusBarColor: GascoColors.white,
//           ),
//         ),
//         colorScheme: const ColorScheme.light(
//           primary: GascoColors.primaryOrange,
//           background: GascoColors.white,
//           error: GascoColors.redAccent,
//         ),
//         datePickerTheme: const DatePickerThemeData(
//           surfaceTintColor: GascoColors.white,
//         ),
//       ),
//       initialRoute: hasUserLoggedIn ? Routes.mainScreen : Routes.welcomeScreen,
//       onGenerateRoute: AppRouter.onGenerateRoute,
//     ),
//   );
// }
