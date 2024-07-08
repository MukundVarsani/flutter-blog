import '../../screen/general/tags/tags_model.dart';

abstract class TagsState {}

class TagsInitialState extends TagsState {}

class TagsLoadingState extends TagsState {}

class TagsLoadedState extends TagsState {
  final List<Tags> tags;
  TagsLoadedState({required this.tags});
}

class TagsErrorState extends TagsState {
  final String error;
  TagsErrorState(this.error);
}

class AddingNewTagState extends TagsState {}

class AddedNewTagState extends TagsState {}
