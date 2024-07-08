import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/PostCubit/post_cubit.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/home/posts_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key, required this.post, required this.imgPath});
  final PostModel post;
  final String imgPath;

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  final PostCubit postCubit = PostCubit();

  @override
  void dispose() {
    postCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: MyColors.white,
            )),
        title: Text(
          widget.post.title.toString(),
          style: const TextStyle(color: MyColors.white),
        ),
      ),
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Hero(
            tag: Key(widget.post.id.toString()),
            child: CachedNetworkImage(
              imageUrl: widget.imgPath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                HeightBox(10.h),
                Text(
                  widget.post.title!,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                Row(
                  children: [
                    const Icon(FeatherIcons.eye),
                    WidthBox(5.h),
                    Text("${widget.post.views} Views"),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        )),
                    const Text("0"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.thumbsDown),
                      color: Colors.red,
                    ),
                    const Text("0"),
                    HeightBox(10.h),
                  ],
                ),
                HtmlWidget(widget.post.body!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
