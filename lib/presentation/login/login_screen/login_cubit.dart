import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/authentication/i_authentication_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final IAuthenticationRepo _authenticationRepository;
  String? selectedUniversity;

  LoginCubit(this._authenticationRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await _authenticationRepository.login(email, password);
      emit(LoginSuccess('Login successful'));
    } catch (e) {
      debugPrint(e.toString());
      emit(LoginError('Failed to login'));
    }
  }


  void changeOption(newValue) {
    selectedUniversity = newValue;
    emit(ChangeOptionState());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPass = true;

  void changePass() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePassState());
  }

  IconData suffix2 = Icons.visibility_outlined;
  bool isPass2 = true;

  void changePass2() {
    isPass2 = !isPass2;
    suffix2 =
    isPass2 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePassState());
  }
}