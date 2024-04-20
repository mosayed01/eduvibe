import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/di/di.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setup();
  runApp(const MyApp(
    isLoggedIn: false,
    isFirstTime: true,
  ));
}
