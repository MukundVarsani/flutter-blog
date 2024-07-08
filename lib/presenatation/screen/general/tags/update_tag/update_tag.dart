import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsCubit.dart';
import 'package:clean_architecture_bloc/presenatation/common_widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class UpdateTag extends StatefulWidget {
  final String id;
  final String title;

  const UpdateTag({super.key, required this.id, required this.title});

  @override
  State<UpdateTag> createState() => _UpdateTagState();
}

class _UpdateTagState extends State<UpdateTag> {
  TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    titleController.text = widget.title;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: MyColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        title: const Text(
          "update Tags",
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
              PrimaryButton(
                title: "update Tag",
                onPressed: () async {
                  String title = titleController.text;
                  String slug = titleController.text.replaceAll(" ", "-");

                  // TagsRepo().updateTag(widget.id, title, slug);
                  context.read<TagsCubit>().updateTags(widget.id, title, slug);
                  titleController.clear();

                  Navigator.pop(context);
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
