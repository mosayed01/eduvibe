import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
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
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.prozaLibreTextTheme(baseTheme.textTheme),
  );
}
