import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/data/repository/categories_repo.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/category/category_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CategoryState.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo = CategoryRepo();

  CategoryCubit() : super(CategoryInitialState()) {
    fetchAllCategory();
  }

  Future<void> fetchAllCategory() async {
    try {
      emit(CategoryLoadingState());
      List<Category> categories = await _categoryRepo.getAllCategory();

      emit(CategoryLoadedState(category: categories));
    } on DioException catch (e) {
      emit(CategoryErrorState(e.message.toString()));
    }
  }

  Future<void> deleteCategory(String id, int index, context) async {
    try {
      emit(CategoryLoadingState());
      await _categoryRepo.deleteCategory(id, index, context);
      fetchAllCategory();
    } on DioException catch (e) {
      emit(CategoryErrorState(e.message.toString()));
    }
  }

  Future<void> addingNewCategory(String title, String slug, context) async {
    try {
      emit(AddingNewCategoryState());
      await _categoryRepo.addNewTag(title, slug);
      emit(AddedNewCategoryState());
      fetchAllCategory();
    } catch (e) {
      Vx.log(e.toString());
      emit(CategoryErrorState(e.toString()));
    }
  }

  Future<void> updateCategory(String id, String title, String slug) async {
    try {
      emit(CategoryLoadingState());
      await _categoryRepo.updateTag(id, title, slug);
      fetchAllCategory();
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }
}
