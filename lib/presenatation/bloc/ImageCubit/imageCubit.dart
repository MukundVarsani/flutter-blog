import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/ImageCubit/imageState.dart';

import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(InitialImageState());

  final ImagePicker imagePicker = ImagePicker();

  pickImage(context) async {
    emit(LoadingImageState());
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(LoadedImageState(image));
    } else {
      VxToast.show(context, msg: "Image not selected");
    }
  }

  getTag(tag) {
    emit(GotTagState(tag));
  }

  getCategory(cat) {
    emit(GotCategoryState(cat));
  }
}
