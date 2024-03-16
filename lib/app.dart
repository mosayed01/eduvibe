import 'package:eduvibe/core/route/app_router.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/theme.dart';
import 'generated/l10n.dart';

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
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MaterialApp(
        navigatorKey: AppRouter.navigateKey,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: buildLightTheme(Brightness.light),
        darkTheme: buildDarkTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        initialRoute: isLoggedIn
            ? Routes.mainScreen
            : isFirstTime
                ? Routes.onBoardingScreen
                : Routes.welcomeScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}