import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsCubit.dart';
import 'package:clean_architecture_bloc/presenatation/common_widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../bloc/TagsCubit/TagsState.dart';

@RoutePage()
class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  TextEditingController titleController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: MyColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        title: const Text(
          "Add Tags",
          style: TextStyle(color: MyColors.white, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              HeightBox(24.h),
              VxTextField(
                fillColor: Colors.transparent,
                controller: titleController,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10,
                hint: "Title",
                suffixColor: MyColors.primaryColor,
              ),
              HeightBox(24.h),
              VxTextField(
                readOnly: true,
                controller: titleController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10,
                hint: "Slug",
                suffixColor: MyColors.primaryColor,
              ),
              const Spacer(),
              BlocBuilder<TagsCubit, TagsState>(
                builder: (context, state) {
                  bool isLoading = false;
                  print(state);
                  if (state is AddingNewTagState) {
                    isLoading = true;
                  }
                  if (state is TagsLoadingState) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                      titleController.clear();
                      isLoading = false;
                    });
                  }
                  return PrimaryButton(
                    node: myFocusNode,
                    title: "Add New Tag",
                    onPressed: () async {
                      String title = titleController.text;
                      String slug = titleController.text.replaceAll(" ", "-");
                      context
                          .read<TagsCubit>()
                          .addingNewTag(title, slug, context);
                    },
                    isLoading: isLoading,
                  );
                },
              ),
              HeightBox(20.h)
            ],
          ),
        ),
      ),
    );
  }
}
