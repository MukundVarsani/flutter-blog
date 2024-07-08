import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../screen/general/category/category_model.dart';

abstract class ImageState {}

class InitialImageState extends ImageState {}

class LoadingImageState extends ImageState {}

class LoadedImageState extends ImageState {
  final XFile? image;
  LoadedImageState(this.image);
}

class GotTagState extends ImageState {
  final Tags? tag;
  GotTagState(this.tag);
}

class GotCategoryState extends ImageState {
  final Category? category;
  GotCategoryState(this.category);
}
