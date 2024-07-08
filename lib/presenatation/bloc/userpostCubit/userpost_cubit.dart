import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/data/repository/userpost_repo.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/userpostCubit/userpost_state.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/profile/user_post_model.dart';

class UserPostsCubit extends Cubit<UserPostState> {
  static final UserPostRepo _userPostRepo = UserPostRepo();

  UserPostsCubit() : super(UserPostLoadingState()) {
    fetchAllUserPost();
  }

  static int id = 0;

  Future<void> fetchAllUserPost() async {
    try {
      emit(UserPostLoadingState());
      UserPostModel userPost = await _userPostRepo.getAllUserPost();
      id = userPost.userDetails!.id!;
      emit(UserPostLoadedState(userPost));
    } catch (e) {
      print(e);
      emit(UserPostErrorState(e.toString()));
    }
  }
}
