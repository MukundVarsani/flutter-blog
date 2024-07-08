import 'package:clean_architecture_bloc/presenatation/screen/general/profile/user_post_model.dart';

class UserPostState {}

class UserPostLoadingState extends UserPostState {}

class UserPostLoadedState extends UserPostState {
  final UserPostModel posts;
  UserPostLoadedState(this.posts);
}

class UserPostErrorState extends UserPostState {
  final String error;
  UserPostErrorState(this.error);
}
