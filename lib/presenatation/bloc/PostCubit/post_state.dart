import '../../screen/general/home/posts_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class AddingPostState extends PostState {}

class AddedPostState extends PostState {}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
