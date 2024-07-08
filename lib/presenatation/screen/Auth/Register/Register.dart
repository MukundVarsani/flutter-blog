import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/data/repository/register_repo.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/registerCubit/register_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/registerCubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/Utils.dart';
import '../../../common_widget/primary_button.dart';
import '../../../router/router.gr.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCheck = false;

  RegisterRepo registerRepo = RegisterRepo();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  registerSubmit() async {
    if (_formKey.currentState!.validate()) {
      print("work");
      Map<String, dynamic> credentials = await registerRepo.userRegister(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);

      String token = credentials['access_token'];
      String message = credentials['message'];
      VxToast.show(context, msg: message);
      Utils.saveToken(token);

      AutoRouter.of(context).push(const GeneralRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
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
                              HeightBox(30.h),
                              Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor),
                                ),
                              ),
                              HeightBox(40.h),
                              const Text(
                                "Name",
                                style: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              HeightBox(8.h),
                              VxTextField(
                                controller: nameController,
                                fillColor: Colors.transparent,
                                borderColor: MyColors.primaryColor,
                                borderType: VxTextFieldBorderType.roundLine,
                                borderRadius: 10,
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: MyColors.primaryColor,
                                ),
                                validator: (name) {
                                  if (name.isEmptyOrNull) {
                                    return "Name filed can't be empty ";
                                  }
                                  return null;
                                },
                                suffixColor: MyColors.primaryColor,
                              ),
                              HeightBox(20.h),
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
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return "Email can't be empty";
                                    }

                                    if (!email.validateEmail()) {
                                      return "Invalid Email ";
                                    }
                                    return null;
                                  }),
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
                                controller: passwordController,
                                isPassword: true,
                                obscureText: true,
                                fillColor: Colors.transparent,
                                borderColor: MyColors.primaryColor,
                                borderType: VxTextFieldBorderType.roundLine,
                                borderRadius: 10,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: MyColors.primaryColor,
                                ),
                                validator: (password) {
                                  if (password.isEmptyOrNull &&
                                      password!.length > 7) {
                                    return "password must contains at least 7 character";
                                  }

                                  return null;
                                },
                                suffixColor: MyColors.primaryColor,
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
                                        color: MyColors
                                            .primaryColor, // Change this color to your desired border color
                                        width:
                                            2.0, // Adjust the width of the border as needed
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
                                  const Text(
                                    'Forget Password',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: MyColors.primaryColor,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              HeightBox(40.h),
                              BlocConsumer<RegisterCubit, RegisterState>(
                                listener: (context, state) {
                                  if (state is LoadedRegister) {
                                    AutoRouter.of(context)
                                        .push(const LoginPageRoute());
                                  }
                                },
                                builder: (context, state) {
                                  bool isLoading = state is LoadingRegister;
                                  return PrimaryButton(
                                    title: "Sign up",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<RegisterCubit>(context)
                                            .registerStatus(
                                                nameController.text.trim(),
                                                emailController.text.trim(),
                                                passwordController.text.trim(),
                                                context);
                                      }
                                    },
                                    isLoading: isLoading,
                                  );
                                },
                              ),
                              HeightBox(20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style:
                                        TextStyle(color: MyColors.primaryColor),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.popUntil(
                                            context, (route) => false);
                                        AutoRouter.of(context)
                                            .replace(const LoginPageRoute());
                                      },
                                      child: const Text(
                                        " Login",
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
