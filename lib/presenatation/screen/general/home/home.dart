import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/home/posts_model.dart';
import 'package:clean_architecture_bloc/utils/loader/home_loading.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../bloc/PostCubit/post_cubit.dart';
import '../../../bloc/PostCubit/post_state.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: HomeLoading(),
              );
            }
            if (state is PostLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      itemCount: state.posts.length,
                      enlargeCenterPage: true,
                      itemBuilder: ((context, index) {
                        PostModel post = state.posts[index];
                        String imgPath = post.featuredimage!;

                        return CachedNetworkImage(
                          imageUrl: imgPath,
                          fit: BoxFit.cover,
                        ).cornerRadius(20).pSymmetric(h: 10);
                      }),
                    ),
                    HeightBox(10.h),
                    HeightBox(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest Posts",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ).pSymmetric(h: 24),
                    HeightBox(20.h),
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shrinkWrap: true,
                      itemCount: state.posts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (c, i) => HeightBox(20.h),
                      itemBuilder: (context, index) {
                        PostModel post = state.posts[index];
                        String imgPath = post.featuredimage!;

                        // .toString()
                        // .prepend('http://techblog.codersangam.com/')
                        // .replaceAll("public", "storage");

                        String timestamp = post.createdAt!;

                        DateTime providedTime = DateTime.parse(timestamp);

                        // Get the current time
                        DateTime currentTime = DateTime.now();

                        // Calculate the difference in days
                        int daysDifference =
                            currentTime.difference(providedTime).inDays;

                        // Convert the days difference into months and years
                        int monthsDifference = daysDifference ~/ 30;
                        int yearsDifference = daysDifference ~/ 365;

                        String timeAgo;

                        if (yearsDifference > 0) {
                          timeAgo =
                              '$yearsDifference year${yearsDifference > 1 ? 's' : ''} ago';
                        } else if (monthsDifference > 0) {
                          timeAgo =
                              '$monthsDifference month${monthsDifference > 1 ? 's' : ''} ago';
                        } else {
                          timeAgo =
                              '$daysDifference day${daysDifference > 1 ? 's' : ''} ago';
                        }

                        return FadedScaleAnimation(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => AutoRouter.of(context).push(
                                    HomeDetailRoute(
                                        post: post, imgPath: imgPath)),
                                child: Hero(
                                  tag: Key(post.id.toString()),
                                  child: CachedNetworkImage(
                                    imageUrl: imgPath,
                                    height: 120,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ).cornerRadius(20),
                                ),
                              ),
                              WidthBox(5.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 179,
                                      child: Text(post.title.toString(),
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 16.sp))),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      WidthBox(5.h),
                                      timeAgo
                                          .toString()
                                          .text
                                          .size(16.sp)
                                          .make(),
                                    ],
                                  ),
                                  HeightBox(5.h),
                                  SizedBox(
                                    width: 170,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${post.views} Views",
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.bookmark,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
