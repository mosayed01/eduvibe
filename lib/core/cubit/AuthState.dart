
abstract class AuthState{}

class InitialState extends AuthState{}
class LoadingState extends AuthState{}
class SuccessState extends AuthState{

}

class ErrorState extends AuthState{
  final String error;
  ErrorState(this.error);
}
class ChangePassState extends AuthState{}
class ChangeOptionState extends AuthState{}
class ChangeOptionForgotPassState extends AuthState{}

