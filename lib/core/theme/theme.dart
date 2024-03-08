import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: EVColors.primaryLight,
      onPrimary: Colors.white,
      secondary: EVColors.primaryLight,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      background: EVColors.backgroundLight,
      onBackground: Colors.white,
      surface: EVColors.backgroundLight,
      onSurface: EVColors.onBackground37Light,
    ),
    textTheme: _createTextTheme(brightness),
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}

ThemeData buildDarkTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: EVColors.primaryDark,
      onPrimary: Colors.white,
      secondary: EVColors.primaryDark,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      background: EVColors.backgroundDark,
      onBackground: EVColors.onBackground60Dark,
      surface: EVColors.backgroundDark,
      onSurface: EVColors.onBackground37Dark,
    ),
    textTheme: _createTextTheme(brightness),
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.prozaLibreTextTheme(baseTheme.textTheme),
  );
}

TextTheme _createTextTheme(Brightness brightness) {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: brightness == Brightness.light
          ? EVColors.onBackground87Light
          : EVColors.onBackground87Dark,
      fontFamily: 'Proza Libre',
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: brightness == Brightness.light
          ? EVColors.onBackground87Light
          : EVColors.onBackground87Dark,
      fontFamily: 'Proza Libre',
    ),
    titleSmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: brightness == Brightness.light
          ? EVColors.onBackground87Light
          : EVColors.onBackground87Dark,
      fontFamily: 'Proza Libre',
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: brightness == Brightness.light
          ? EVColors.onBackground60Light
          : EVColors.onBackground60Dark,
      fontFamily: 'Proza Libre',
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: brightness == Brightness.light
          ? EVColors.onBackground60Light
          : EVColors.onBackground60Dark,
      fontFamily: 'Proza Libre',
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: brightness == Brightness.light
          ? EVColors.onBackground60Light
          : EVColors.onBackground60Dark,
      fontFamily: 'Proza Libre',
    ),
    labelMedium: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      color: brightness == Brightness.light
          ? EVColors.onBackground60Light
          : EVColors.onBackground60Dark,
      fontFamily: 'Proza Libre',
    ),
  );
}
