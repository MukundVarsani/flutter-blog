import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardFirst extends StatelessWidget {
  final String imgPath;
  final String content;

  const OnBoardFirst({super.key, required this.imgPath, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imgPath, height: 333.h,width: 333.w,),
        Text(content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,

          ),)
      ],
    );
  }
}
