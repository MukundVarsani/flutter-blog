import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/generated/assets.dart';
import 'package:clean_architecture_bloc/presenatation/common_widget/primary_button.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widget/outline_button.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/Background Image.png"),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesJourno,
                    color: Colors.orange,
                    height: 42.h,
                    width: 139.w,
                  ),
                ),
                const Spacer(),
                Text(
                  "Explore the world,\nBillions of Thoughts",
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: MyColors.white,
                      fontWeight: FontWeight.w700),
                ),
                HeightBox(20.h),
                PrimaryButton(
                    title: "Login",
                    onPressed: () =>
                        AutoRouter.of(context).push(const LoginPageRoute())),
                HeightBox(12.h),
                OutlineButton(
                  onPressed: () =>
                      AutoRouter.of(context).push(const RegisterPageRoute()),
                  title: 'Register',
                ),
                HeightBox(12.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
