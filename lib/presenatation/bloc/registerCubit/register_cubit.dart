import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/registerCubit/register_state.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/repository/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepo registerRepo = RegisterRepo();

  RegisterCubit() : super(InitialRegister());

  void registerStatus(
      String name, String email, String password, context) async {
    try {
      await registerRepo.userRegister(
          name: name, email: email, password: password);
      VxToast.show(context, msg: "Account created!!, Now you can login");
      emit(LoadedRegister("Account created"));
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      emit(ErrorRegister(e.toString()));
    }
  }
}
