import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/utils/shimmer_container.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  20.h.heightBox,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const LoadingContainer(
                      height: 200,
                      width: 200,
                    ),
                  ),
                  20.h.heightBox,
                  const LoadingContainer(height: 10, width: 280),
                  10.h.heightBox,
                  const LoadingContainer(height: 10, width: 250),
                  10.h.heightBox,
                  const LoadingContainer(height: 10, width: 230),
                  10.h.heightBox,
                  const LoadingContainer(height: 10, width: 230),
                  10.h.heightBox,
                  const LoadingContainer(height: 10, width: 230),
                  20.h.heightBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoadingContainer(height: 40, width: 40),
                      LoadingContainer(height: 40, width: 40),
                      LoadingContainer(height: 40, width: 40),
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
                const LoadingContainer(height: 10, width: 90),
                HeightBox(10.h),
                GridView.builder(
                    itemCount: 4,
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
                      return Column(
                        children: [
                          FadedScaleAnimation(
                            child:
                                const LoadingContainer(height: 120, width: 150),
                          ),
                          Column(
                            children: [
                              10.h.heightBox,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LoadingContainer(height: 10, width: 40),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child:
                                        LoadingContainer(height: 20, width: 5),
                                  ),
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
}
