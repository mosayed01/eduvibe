import 'package:flutter/material.dart';

import 'app_router.dart';

class NavigatorHelper {
  static final BuildContext context =
      AppRouter.navigateKey.currentState!.context;

  /// Navigate to a new route and let the old route
  static Future<dynamic> push(Widget page) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  /// Navigate to a new route and finishing the old route
  static Future<dynamic> pushReplacement(Widget page) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false,
      );

  static pushNamedAndRemoveUntil(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);

  /// GO back method
  static void pop() => Navigator.pop(context);

  /// Restart the app
  static Future<dynamic> restart() =>
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}
