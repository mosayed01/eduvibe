
import 'package:eduvibe/noteDatabase/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';


import 'app.dart';
import 'core/di/di.dart';

Future main() async {

  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.openBox('notes_box');
  Hive.registerAdapter(NoteModelAdapter());
  setup();
  runApp(const MyApp(
    isLoggedIn: false,
    isFirstTime: true,
  ));

}
