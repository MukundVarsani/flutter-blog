import 'package:clean_architecture_bloc/utils/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class TagsLoading extends StatelessWidget {
  const TagsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (c, i) => HeightBox(10.h),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 16),
                ),
                title: const LoadingContainer(
                  width: 120,
                  height: 50,
                ),
                trailing: const SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoadingContainer(height: 40, width: 40),
                      LoadingContainer(height: 40, width: 40),
                    ],
                  ),
                ),
              );
            }));
  }
}

//
