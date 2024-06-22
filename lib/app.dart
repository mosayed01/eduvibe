import 'package:eduvibe/core/route/app_router.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/presentation/Notes/notes/data/hive_data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/theme.dart';
import 'generated/l10n.dart';

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

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
                ? Routes.alarmScreen
                : Routes.mainScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
