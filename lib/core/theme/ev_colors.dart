import 'package:flutter/material.dart';

class EVColors {
  static const Color primaryLight = Color(0xFF80BCBD);
  static const Color backgroundLight = Color(0xFFFEFEFE);
  static const Color onBackground87Light = Color(0xDE121212);
  static const Color onBackground60Light = Color(0x99121212);
  static const Color onBackground37Light = Color(0x5E121212);
  static const Color onBackground16Light = Color(0x29121212);

  static const Color primaryDark = Color(0xFF1B4242);
  static const Color backgroundDark = Color(0xFF313131);
  static const Color onBackground87Dark = Color(0xDEFFFFFF);
  static const Color onBackground60Dark = Color(0x99FFFFFF);
  static const Color onBackground37Dark = Color(0x5EFFFFFF);
  static const Color onBackground16Dark = Color(0x29FFFFFF);
}

// region Helpers
bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color getOnBackground87(BuildContext context) {
  return isDarkMode(context)
      ? EVColors.onBackground87Dark
      : EVColors.onBackground87Light;
}

Color getOnBackground60(BuildContext context) {
  return isDarkMode(context)
      ? EVColors.onBackground60Dark
      : EVColors.onBackground60Light;
}

Color getOnBackground37(BuildContext context) {
  return isDarkMode(context)
      ? EVColors.onBackground37Dark
      : EVColors.onBackground37Light;
}

Color getOnBackground16(BuildContext context) {
  return isDarkMode(context)
      ? EVColors.onBackground16Dark
      : EVColors.onBackground16Light;
}
// endregion
