abstract class RegisterState {}

class InitialRegister extends RegisterState {}

class LoadingRegister extends RegisterState {}

class LoadedRegister extends RegisterState {
  final String msg;
  LoadedRegister(this.msg);
}

class ErrorRegister extends RegisterState {
  final String error;

  ErrorRegister(this.error);
}
