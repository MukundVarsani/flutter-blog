import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/LoginCubit/login_state.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/repository/login_repo.dart';
import '../../../utils/Utils.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginRepo loginRepo = LoginRepo();
  LoginCubit() : super(LoginInitialState());

  void loginStatus(
      {required String email, required String password, context}) async {
    emit(LoginLoadingState());
    try {
      // print("work from login cubit");
      Map credentials =
          await loginRepo.userLogin(email: email, password: password);
      print(credentials);

      String message = credentials['message'];
      if (message != "Unauthorized") {
        String token = credentials['access_token'];
        VxToast.show(context, msg: message);
        Utils.saveToken(token);
      }
      emit(LoginLoadedState());
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      emit(LoginErrorState(e.toString()));
    }
    //
  }
}
