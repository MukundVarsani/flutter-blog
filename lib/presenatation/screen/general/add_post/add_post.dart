import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/ImageCubit/imageCubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/ImageCubit/imageState.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/PostCubit/post_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsState.dart';
import 'package:clean_architecture_bloc/presenatation/enum/navigate_type.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/category/category_model.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../bloc/PostCubit/post_state.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final QuillController _controller = QuillController.basic();
  final TextEditingController titleController = TextEditingController();
  String? cat;
  String? tag;
  String? filePath;
  String? fileName;

  @override
  void dispose() {
    _controller.dispose();
    titleController.dispose();
    super.dispose();
  }

  bool isAdding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Add post",
          style: TextStyle(color: MyColors.white),
        ),
        centerTitle: true,
        actions: [
          BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
              if (state is PostLoadedState) {
                isAdding = false;
              }
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () async {
                    String slug = titleController.text.replaceAll(" ", "-");

                    if (filePath.isEmptyOrNull) {
                      VxToast.show(context, msg: "Select Image");
                      return;
                    }
                    if (titleController.text.isEmptyOrNull) {
                      VxToast.show(context, msg: "Fill Title");
                      return;
                    }
                    if (tag.isEmptyOrNull) {
                      VxToast.show(context, msg: "Select Tag");
                      return;
                    }
                    if (cat.isEmptyOrNull) {
                      VxToast.show(context, msg: "Select Category");
                      return;
                    }
                    if (_controller.document
                        .toPlainText()
                        .trim()
                        .isEmptyOrNull) {
                      VxToast.show(context, msg: "Fill description");
                      return;
                    }
                    isAdding = true;
                    await BlocProvider.of<PostCubit>(context).addNewPost(
                        titleController.text.trim(),
                        slug,
                        '13',
                        '4',
                        _controller.document.toPlainText(),
                        '1',
                        filePath!,
                        fileName!,
                        context);

                    // _controller.clear();
                    titleController.clear();
                  },
                  icon: isAdding
                      ? const CircularProgressIndicator.adaptive(
                          backgroundColor: MyColors.white,
                        )
                      : const Icon(
                          FeatherIcons.check,
                          color: MyColors.white,
                        ));
            },
          )
        ],
        backgroundColor: MyColors.primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          20.h.heightBox,
          BlocConsumer<ImageCubit, ImageState>(
            listener: (_, state) {
              if (state is LoadedImageState) {
                filePath = state.image?.path;
                fileName = state.image?.name;
              }
              ;
            },
            builder: (context, state) {
              return Stack(alignment: Alignment.bottomRight, children: [
                (state is LoadedImageState)
                    ? Image.file(
                        File(state.image!.path),
                        height: 250,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<ImageCubit>(context).pickImage(context);
                    },
                    icon: const Icon(
                      FeatherIcons.camera,
                      color: MyColors.primaryColor,
                    ))
              ]).cornerRadius(20);
            },
          ),
          20.h.heightBox,
          VxTextField(
            controller: titleController,
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10,
            hint: "Title",
            suffixColor: MyColors.primaryColor,
          ),
          20.h.heightBox,
          VxTextField(
            controller: titleController,
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10,
            hint: "Slug",
            suffixColor: MyColors.primaryColor,
          ),
          20.h.heightBox,
          BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              if (state is GotTagState) {
                tag = state.tag?.title;
                return Container(
                  height: 60,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      Tags? tag = await AutoRouter.of(context).push<Tags>(
                          TagsScreenRoute(navigateType: NavigateType.inner));

                      context.read<ImageCubit>().getTag(tag);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.tag != null
                            ? Text(
                                state.tag!.title.toString(),
                              )
                            : const Text(
                                "Tags",
                              ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FeatherIcons.chevronRight))
                      ],
                    ),
                  ),
                );
              }
              return Container(
                height: 60,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () async {
                    Tags? tag = await AutoRouter.of(context).push<Tags>(
                        TagsScreenRoute(navigateType: NavigateType.inner));
                    context.read<ImageCubit>().getTag(tag);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (tag.isEmptyOrNull)
                          ? const Text(
                              "Tags",
                            )
                          : Text(tag!),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FeatherIcons.chevronRight))
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              if (state is GotCategoryState) {
                cat = state.category?.title;
                return Container(
                  height: 60,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      Category? cat = await AutoRouter.of(context)
                          .push<Category>(CategoryScreenRoute(
                              navigateType: NavigateType.inner));
                      context.read<ImageCubit>().getCategory(cat);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.category!.title.toString(),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FeatherIcons.chevronRight))
                      ],
                    ),
                  ),
                );
              }

              return InkWell(
                onTap: () async {
                  Category? cat = await AutoRouter.of(context).push<Category>(
                      CategoryScreenRoute(navigateType: NavigateType.inner));

                  context.read<ImageCubit>().getCategory(cat);
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FeatherIcons.chevronRight))
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          QuillToolbar.simple(
              configurations:
                  QuillSimpleToolbarConfigurations(controller: _controller)),
          SizedBox(
            height: 500,
            child: QuillEditor.basic(
                configurations:
                    QuillEditorConfigurations(controller: _controller)),
          )
        ],
      ),
    );
  }
}
