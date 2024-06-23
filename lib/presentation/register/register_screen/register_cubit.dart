import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/authentication/i_authentication_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IAuthenticationRepo _authenticationRepository;
  String? selectedUniversity;

  RegisterCubit(this._authenticationRepository) : super(RegisterInitial());

  Future<void> register(UserRegistration userRegistration) async {
    emit(RegisterLoading());
    try {
      final isSuccess =
          await _authenticationRepository.register(userRegistration);
      if (isSuccess) {
        emit(RegisterSuccess('Registration successful'));
      } else {
        emit(RegisterError('Failed to register'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterError('Failed to register'));
    }
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

  void changeOption(newValue) {
    selectedUniversity = newValue;
    emit(ChangeOptionState());
  }
}
