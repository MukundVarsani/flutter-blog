import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/common_widget/primary_button.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:clean_architecture_bloc/presenatation/screen/onboard/widget/onBoardFirst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController();
  int currentPage = 1;

  onTapNext() {
    print(currentPage);
    if (currentPage < 3) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Journo.png',
                  color: MyColors.primaryColor,
                  height: 42.h,
                  width: 139.w,
                ),
                SizedBox(
                  height: 61.h,
                ),
                Expanded(
                    child: PageView(
                  controller: pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: const [
                    OnBoardFirst(
                        imgPath: "assets/images/onboard1.png",
                        content:
                            "Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community"),
                    OnBoardFirst(
                        imgPath: "assets/images/onboard2.png",
                        content:
                            "Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community"),
                    OnBoardFirst(
                        imgPath: "assets/images/onboard3.png",
                        content:
                            "Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community"),
                  ],
                )),
                PrimaryButton(
                  title: "Get Started",
                  onPressed: () =>
                      AutoRouter.of(context).push(const AuthRoute()),
                ),
                SizedBox(
                  height: 61.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      effect: const WormEffect(
                        activeDotColor: MyColors.primaryColor,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                      count: 3,
                      onDotClicked: (index) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    InkWell(
                      onTap: () => onTapNext(),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
