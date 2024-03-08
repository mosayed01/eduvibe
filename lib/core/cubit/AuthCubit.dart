
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


}
