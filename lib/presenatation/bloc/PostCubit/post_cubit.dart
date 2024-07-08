import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/data/repository/post_repo.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/PostCubit/post_state.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/home/posts_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../userpostCubit/userpost_cubit.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepo _postRepo = PostRepo();
  final UserPostsCubit userPostsCubit = UserPostsCubit();

  PostCubit() : super(PostLoadingState()) {
    fetchAllPost();
  }

  Future<void> fetchAllPost() async {
    try {
      emit(PostLoadingState());
      List<PostModel> posts = await _postRepo.getAllPost();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }

  Future<void> addNewPost(
      String title,
      String slug,
      String categories,
      String tags,
      String body,
      String status,
      String filePath,
      String fileName,
      context) async {
    emit(AddingPostState());

    try {
      String id = UserPostsCubit.id.toString();

      var data = await _postRepo.addPost(
          title, slug, categories, tags, body, status, id, filePath, fileName);

      if (data['status'] == 1) {
        VxToast.show(context, msg: data['message']);
        await fetchAllPost();
      } else {
        VxToast.show(context, msg: "Error: Status Code 0");
        emit(PostErrorState("Error"));
      }
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
