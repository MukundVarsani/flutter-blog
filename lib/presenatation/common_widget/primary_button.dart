import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/my_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final FocusNode? node;

  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isLoading,
      this.node});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: node,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          minimumSize: Size(MediaQuery.of(context).size.width.w, 44.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.r))),
      child: isLoading == true
          ? const CircularProgressIndicator(
              color: MyColors.white,
            )
          : Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
    );
  }
}
