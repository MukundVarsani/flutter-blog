
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/my_colors.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const OutlineButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: Size(MediaQuery.of(context).size.width.w, 44.h),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: MyColors.white),
              borderRadius: BorderRadius.circular(11.r))),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}