import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);

  @override
  List<Object> get props => [message];
}

class ChangePassState extends RegisterState {}

class ChangeOptionState extends RegisterState {}

class ChangeOptionState2 extends RegisterState {}