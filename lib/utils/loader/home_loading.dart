import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:clean_architecture_bloc/utils/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoadingContainer(height: 200, width: 300),
              HeightBox(30.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoadingContainer(height: 10, width: 80),
                  LoadingContainer(height: 10, width: 80),
                ],
              ).pSymmetric(h: 24),
              HeightBox(20.h),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (c, i) => HeightBox(20.h),
                itemBuilder: (context, index) {
                  return FadedScaleAnimation(
                    child: Row(
                      children: [
                        const LoadingContainer(
                          height: 120,
                          width: 150,
                        ).cornerRadius(20),
                        WidthBox(5.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LoadingContainer(height: 10, width: 100),
                            6.h.heightBox,
                            Row(
                              children: [
                                const LoadingContainer(height: 10, width: 30),
                                WidthBox(5.h),
                                const LoadingContainer(height: 10, width: 60),
                              ],
                            ),
                            HeightBox(5.h),
                            const SizedBox(
                              width: 170,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LoadingContainer(height: 10, width: 100),
                                    LoadingContainer(height: 30, width: 20),
                                  ]),
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
        ),
      ),
    );
  }
}
