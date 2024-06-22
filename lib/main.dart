
import 'package:eduvibe/presentation/Notes/notes/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';


import 'app.dart';
import 'core/di/di.dart';

Future main() async {

  await ScreenUtil.ensureScreenSize();
  /// Initial Hive DB
  await Hive.initFlutter();

  /// Register Hive Adapter
  Hive.registerAdapter<Task>(TaskAdapter());

  /// Open box
  var box = await Hive.openBox<Task>("tasksBox");

  /// Delete data from previous day
  // ignore: avoid_function_literals_in_foreach_calls
  box.values.forEach((task) {
    if (task.createdAtTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });
  setup();

  runApp(BaseWidget(child: const MyApp(
    isLoggedIn: false,
    isFirstTime: true,
  )));


}
