abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
