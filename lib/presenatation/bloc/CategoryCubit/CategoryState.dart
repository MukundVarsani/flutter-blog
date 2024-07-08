import 'package:clean_architecture_bloc/presenatation/screen/general/category/category_model.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Category> category;
  CategoryLoadedState({required this.category});
}

class CategoryErrorState extends CategoryState {
  final String error;
  CategoryErrorState(this.error);
}

class AddingNewCategoryState extends CategoryState {}

class AddedNewCategoryState extends CategoryState {}
