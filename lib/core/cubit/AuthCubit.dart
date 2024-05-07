
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AuthState.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  String? selectedUniversity;

  void changeOption(newValue){
    selectedUniversity =newValue;
      emit(ChangeOptionState());
    }
  // bool option=false;
  // bool option1=false;



  // void forgotPassOption(){
  //   option=!option;
  //   option1=!option;
  //   emit(ChangeOptionForgotPassState());
  // }
  //
  // void forgotPass2Option(){
  //   option1=!option1;
  //   option=!option1;
  //   emit(ChangeOptionForgotPassState());
  // }

  IconData suffix =Icons.visibility_outlined;
  bool isPass = true;

  void changePass (){
    isPass = !isPass;
    suffix =isPass? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassState());
  }

  IconData suffix2 =Icons.visibility_outlined;
  bool isPass2 = true;
  void changePass2 (){
    isPass2 = !isPass2;
    suffix2 =isPass2? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePassState());
  }

///////////////////////////////////////////////////////

  // late Database database;
  //
  // void createDatabase()  {
  //   openDatabase('Note.db', version: 1,
  //       onCreate: (database, version) {
  //         print('DataBase Created');
  //         database
  //             .execute(
  //             'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, color TEXT, date TEXT, time TEXT, status TEXT)')
  //             .then((value) {
  //           print('Table Created');
  //         }).catchError((error) {
  //           print('Error When Creating DB ${error.toString()}');
  //         });
  //       }, onOpen: (database) {
  //
  //         // getDataBase(database);
  //
  //
  //         print('DataBase Opened');
  //       }).then((value) {
  //     database=value;
  //     emit(AppCreateDataBase());
  //   });
  // }

  // Future insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  //
  // }) async {
  //   await database.transaction((txn) {
  //     txn.rawInsert(
  //         'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")')
  //         .then((value)
  //     {
  //       print('$value Inserted Successfully');
  //       emit(AppInsertDataBase());
  //       // getDataBase(database);
  //     }).catchError((error) {
  //       print('Error When Inserting DB ${error.toString()}');
  //     });
  //
  //     return Future(() => null);
  //   });
  // }

  // void getDataBase(database)  {
  //
  //   emit(AppGetDataBaseLoadingState());
  //   database.rawQuery('SELECT * FROM tasks').then((value) {
  //
  //     value.forEach((element)
  //     {
  //       if(element['status']=='new'){
  //         newTasks.add(element);
  //       }
  //       else if(element['status']=='done'){
  //         doneTasks.add(element);
  //       }
  //       else{
  //         archiveTasks.add(element);
  //       }
  //
  //     });
  //     emit(AppGetDataBase());
  //   });
  // }




}
