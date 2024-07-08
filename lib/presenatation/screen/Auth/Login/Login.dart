import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/LoginCubit/login_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/common_widget/primary_button.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/assets.dart';
import '../../../bloc/LoginCubit/login_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: SafeArea(
          child: FadedScaleAnimation(
            child: ListView(
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesJourno,
                    height: 42.h,
                    width: 139.w,
                  ),
                ),
                HeightBox(100.h),
                Form(
                  key: _formKey,
                  child: Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeightBox(50.h),
                              Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor),
                                ),
                              ),
                              HeightBox(48.h),
                              const Text(
                                "Email",
                                style: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              HeightBox(8.h),
                              VxTextField(
                                controller: emailController,
                                fillColor: Colors.transparent,
                                borderColor: MyColors.primaryColor,
                                borderType: VxTextFieldBorderType.roundLine,
                                borderRadius: 10,
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: MyColors.primaryColor,
                                ),
                                onChanged: (email) {},
                                validator: (email) {
                                  if (email == null || email.isEmpty) {
                                    return "Email can't be empty";
                                  }

                                  if (!email.validateEmail()) {
                                    return "Invalid Email ";
                                  }
                                  return null;
                                },
                              ),
                              HeightBox(20.h),
                              const Text(
                                "Password",
                                style: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              HeightBox(8.h),
                              VxTextField(
                                isPassword: true,
                                obscureText: true,
                                controller: passwordController,
                                fillColor: Colors.transparent,
                                borderColor: MyColors.primaryColor,
                                borderType: VxTextFieldBorderType.roundLine,
                                borderRadius: 10,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: MyColors.primaryColor,
                                ),
                                onChanged: (value) {
                                  // _formKey.currentState!.validate();
                                },
                                suffixColor: MyColors.primaryColor,
                                validator: (password) {
                                  if (password!.isEmpty) {
                                    return "password can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              HeightBox(20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: CheckboxListTile(
                                      value: isCheck,
                                      onChanged: (value) {
                                        isCheck = value!;
                                        setState(() {});
                                      },
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: MyColors.primaryColor,
                                      side: const BorderSide(
                                        color: MyColors.primaryColor,
                                        width: 2.0,
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text(
                                        "Remember me",
                                        style: TextStyle(
                                            color: MyColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Forget Password',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: MyColors.primaryColor,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              HeightBox(60.h),
                              BlocConsumer<LoginCubit, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginLoadedState) {
                                    Navigator.popUntil(
                                        context, (route) => false);

                                    AutoRouter.of(context)
                                        .replace(const GeneralRoute());
                                  }
                                },
                                builder: (context, state) {
                                  bool isLoading = state is LoginLoadingState;
                                  print("Login page $state");
                                  if (state is LoginErrorState) {
                                    return Center(
                                      child: Text(state.error),
                                    );
                                  }
                                  return PrimaryButton(
                                    title: "Submit",
                                    isLoading: isLoading,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<LoginCubit>(context)
                                            .loginStatus(
                                                context: context,
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim());
                                      }
                                    },
                                  );
                                },
                              ),
                              HeightBox(20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have account?",
                                    style:
                                        TextStyle(color: MyColors.primaryColor),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.popUntil(
                                            context, (route) => false);

                                        AutoRouter.of(context)
                                            .replace(const RegisterPageRoute());
                                      },
                                      child: const Text(
                                        " Sign up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: MyColors.primaryColor),
                                      ))
                                ],
                              ),
                            ]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
