import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/core/constants/my_colors.dart';
import 'package:clean_architecture_bloc/presenatation/enum/navigate_type.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/add_post/add_post.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/category/category.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/home/home.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/profile/profile.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:feather_icons/feather_icons.dart';



@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}


class _GeneralState extends State<General> {
  List<TabItem> items = [
    const TabItem(icon: FeatherIcons.home),
    const TabItem(icon: FeatherIcons.tag),
    const TabItem(icon: FeatherIcons.plus),
    const TabItem(icon: FeatherIcons.hash),
    const TabItem(icon: FeatherIcons.user),
  ];

  int currentIndex = 0;

  List<Widget> pages = [
    const Home(),
    const TagsScreen(navigateType: NavigateType.outer),
    const AddPost(),
    const CategoryScreen(
      navigateType: NavigateType.outer,
    ),
    const Profile()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomBarCreative(
          backgroundColor: Colors.white,
          color: MyColors.primaryColor.withOpacity(0.3),
          colorSelected: MyColors.primaryColor,
          indexSelected: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: items,
        ));
  }
}
