
import 'package:alarm/alarm.dart';
import 'package:eduvibe/data/local/user_data_store.dart';
import 'package:eduvibe/domain/authentication/i_authentication_repo.dart';
import 'package:eduvibe/presentation/Notes/notes/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';


import 'app.dart';
import 'core/di/di.dart';

Future main() async {

  await ScreenUtil.ensureScreenSize();
  Alarm.init();
  /// Initial Hive DB
  await Hive.initFlutter();

  /// Register Hive Adapter
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter<User>(UserAdapter());


  /// Open box
  var box = await Hive.openBox<Task>("tasksBox");
  await Hive.openBox<User>("userBox");

  /// Delete data from previous day
  // ignore: avoid_function_literals_in_foreach_calls
  box.values.forEach((task) {
    if (task.createdAtTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });

  setup();

  final user = await getIt<UserHiveDataStore>().getUser();

  runApp(BaseWidget(child: MyApp(
    isLoggedIn: user != null,
    isFirstTime: false,
  )));
}
