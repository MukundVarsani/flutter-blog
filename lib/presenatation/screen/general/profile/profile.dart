import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/userpostCubit/userpost_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/profile/user_post_model.dart';
import 'package:clean_architecture_bloc/utils/loader/profile_loading.dart';
import 'package:clean_architecture_bloc/utils/shimmer_container.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../bloc/userpostCubit/userpost_state.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final UserPostsCubit _userPostsCubit = UserPostsCubit();

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    Navigator.popUntil(context, (route) => false);
    AutoRouter.of(context).push(const OnBoardRoute());
  }

  @override
  void dispose() {
    _userPostsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => logout(),
              icon: const Icon(
                FeatherIcons.logOut,
                color: MyColors.white,
              ).pOnly(right: 10),
            )
          ],
          backgroundColor: MyColors.primaryColor,
        ),
        body: BlocBuilder<UserPostsCubit, UserPostState>(
            builder: (context, state) {
          if (state is UserPostLoadingState) {
            return const ProfileLoading();
          }
          if (state is UserPostLoadedState) {
            UserDetails userDetails = state.posts.userDetails!;

            // Vx.log(userDetails.profilePhotoUrl);
            return LiquidPullToRefresh(
              onRefresh: () {
                return context.read<UserPostsCubit>().fetchAllUserPost();
              },
              height: 100,
              springAnimationDurationInMilliseconds: 1500,
              backgroundColor: MyColors.white,
              showChildOpacityTransition: true,
              color: MyColors.primaryColor,
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: const BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 90,
                            child: Image(
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: const LoadingContainer(
                                        height: 200, width: 200),
                                  );
                                }
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  userDetails.name!
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: MyColors.primaryColor),
                                );
                              },
                              image: NetworkImage(
                                  userDetails.profilePhotoUrl.toString()),
                            ),
                          ),
                          10.h.heightBox,
                          Text(
                            userDetails.name!,
                            style: TextStyle(
                                fontSize: 16.sp, color: MyColors.white),
                          ),
                          Text(
                            userDetails.email!,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors.white),
                          ),
                          20.h.heightBox,
                          Text(
                            userDetails.about != null
                                ? userDetails.about!
                                : "Not added",
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors.white),
                            textAlign: TextAlign.center,
                          ),
                          20.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    state.posts.postsCount.toString(),
                                    style: const TextStyle(
                                        color: MyColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Text(
                                    "Post",
                                    style: TextStyle(
                                        color: MyColors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        color: MyColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                        color: MyColors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "6",
                                    style: TextStyle(
                                        color: MyColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Follower",
                                    style: TextStyle(
                                        color: MyColors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.h.heightBox,
                        Text(
                          "My posts",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        HeightBox(10.h),
                        GridView.builder(
                            itemCount: state.posts.posts?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.9,
                            ),
                            itemBuilder: (context, index) {
                              Posts post = state.posts.posts![index];
                              String imgPath = post.featuredimage
                                  .toString()
                                  .prepend('http://techblog.codersangam.com/')
                                  .replaceAll("public", "storage");
                              return Column(
                                children: [
                                  FadedScaleAnimation(
                                    child: CachedNetworkImage(
                                      imageUrl: imgPath,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      width: 200,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      10.h.heightBox,
                                      Row(
                                        children: [
                                          post.title!.text
                                              .maxLines(2)
                                              .medium
                                              .make()
                                              .expand(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  FeatherIcons.moreVertical))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is UserPostErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox();
        }));
  }
}
