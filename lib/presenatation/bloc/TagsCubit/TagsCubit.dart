import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/data/repository/tags_repo.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsState.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

class TagsCubit extends Cubit<TagsState> {
  final TagsRepo _tagsRepo = TagsRepo();

  TagsCubit() : super(TagsInitialState()) {
    fetchAllTags();
  }

  Future<void> fetchAllTags() async {
    try {
      if (!isClosed) {
        emit(TagsLoadingState());
      }
      List<Tags> tags = await _tagsRepo.getAllTags();
      if (!isClosed) {
        emit(TagsLoadedState(tags: tags));
      }
    } on DioException catch (e) {
      emit(TagsErrorState(e.message.toString()));
    }
  }

  Future<void> addingNewTag(String title, String slug, context) async {
    try {
      emit(AddingNewTagState());
      await _tagsRepo.addNewTag(title, slug);
      emit(AddedNewTagState());
      fetchAllTags();
    } catch (e) {
      Vx.log(e.toString());
      emit(TagsErrorState(e.toString()));
    }
  }

  Future<void> deleteTags(String id, int index, context) async {
    try {
      emit(TagsLoadingState());
      await _tagsRepo.deleteTags(id, index, context);
      fetchAllTags();
    } on DioException catch (e) {
      emit(TagsErrorState(e.message.toString()));
    }
  }


  Future<void> updateTags(String id, String title, String slug) async {
    try {
      emit(TagsLoadingState());
      await _tagsRepo.updateTag(id, title, slug);
      fetchAllTags();
    } catch (e) {
      emit(TagsErrorState(e.toString()));
    }
  }
}
