import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/CategoryCubit/CategoryState.dart';
import 'package:clean_architecture_bloc/presenatation/enum/navigate_type.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/category/add_new_category/add_new_category.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/category/update_category/update_categor.dart';
import 'package:clean_architecture_bloc/utils/loader/tags_loading.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../bloc/CategoryCubit/CategorylCubit.dart';
import 'category_model.dart';

@RoutePage<Category>()
class CategoryScreen extends StatefulWidget {
  final NavigateType navigateType;
  const CategoryScreen({super.key, required this.navigateType});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        automaticallyImplyLeading: (NavigateType.inner == widget.navigateType),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddCategory()));
              },
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
        backgroundColor: MyColors.primaryColor,
      ),
      body: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
        if (state is CategoryErrorState) {
          SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }, builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const TagsLoading();
        }
        if (state is CategoryLoadedState) {
          return ListView.separated(
              shrinkWrap: true,
              itemCount: state.category.length,
              separatorBuilder: (c, i) => HeightBox(10.h),
              itemBuilder: (context, index) {
                Category category = state.category[index];

                return Card(
                  child: ListTile(
                    onTap: () {
                      if ((NavigateType.inner == widget.navigateType)) {
                        AutoRouter.of(context).pop<Category>(category);
                      }
                    },
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    title: Text(category.title.toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UpdateCategory(
                                              id: state.category[index].id
                                                  .toString(),
                                              title: state.category[index].title
                                                  .toString(),
                                            )));
                              },
                              icon: const Icon(
                                FeatherIcons.edit2,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CategoryCubit>(context)
                                    .deleteCategory(
                                        category.id.toString(), index, context);
                              },
                              icon: const Icon(
                                FeatherIcons.trash,
                                color: MyColors.primaryColor,
                              )),
                        ],
                      ),
                    ),
                  ),
                );

                return const SizedBox();
              });
        }

        return const SizedBox();
      }),
    );
  }
}
