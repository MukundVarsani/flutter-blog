import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsCubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsState.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/add_new_tag/add_new_tag.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/update_tag/update_tag.dart';
import 'package:clean_architecture_bloc/utils/loader/tags_loading.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../enum/navigate_type.dart';

@RoutePage<Tags>()
class TagsScreen extends StatefulWidget {
  final NavigateType navigateType;
  const TagsScreen({super.key, required this.navigateType});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  final TagsCubit _tagsCubit = TagsCubit();
  //
  @override
  void dispose() {
    _tagsCubit.close();
    // print('Tags Screen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        automaticallyImplyLeading: (NavigateType.inner == widget.navigateType),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _tagsCubit.close();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const AddTag()));
              },
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.white,
              ))
        ],
        backgroundColor: MyColors.primaryColor,
      ),
      body: BlocConsumer<TagsCubit, TagsState>(
        listener: (context, state) {
          if (state is TagsErrorState) {
            SnackBar snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is TagsLoadingState) {
            return const TagsLoading();
          } else if (state is TagsLoadedState) {
            return ListView.separated(
                shrinkWrap: true,
                itemCount: state.tags.length,
                separatorBuilder: (c, i) => HeightBox(10.h),
                itemBuilder: (context, index) {
                  Tags tag = state.tags[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        if (NavigateType.inner == widget.navigateType) {
                          AutoRouter.of(context).pop<Tags>(tag);
                        }
                      },
                      leading: Text(
                        " ${index + 1}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      title: SizedBox(
                          width: 150.h,
                          child: Text(
                            "${tag.title}",
                            overflow: TextOverflow.ellipsis,
                          )),
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
                                          builder: (_) => UpdateTag(
                                                id: state.tags[index].id
                                                    .toString(),
                                                title: state.tags[index].title
                                                    .toString(),
                                              )));
                                },
                                icon: const Icon(
                                  FeatherIcons.edit2,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  context.read<TagsCubit>().deleteTags(
                                      tag.id.toString(), index, context);
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
                });
          }
          return const Center(child: Text("Data not Found"));
        },
      ),
    );
  }
}

//
