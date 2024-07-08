// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:clean_architecture_bloc/presenatation/enum/navigate_type.dart'
    as _i19;
import 'package:clean_architecture_bloc/presenatation/screen/Auth/auth.dart'
    as _i3;
import 'package:clean_architecture_bloc/presenatation/screen/Auth/Login/Login.dart'
    as _i8;
import 'package:clean_architecture_bloc/presenatation/screen/Auth/Register/Register.dart'
    as _i10;
import 'package:clean_architecture_bloc/presenatation/screen/general/category/add_new_category/add_new_category.dart'
    as _i1;
import 'package:clean_architecture_bloc/presenatation/screen/general/category/category.dart'
    as _i4;
import 'package:clean_architecture_bloc/presenatation/screen/general/category/category_model.dart'
    as _i16;
import 'package:clean_architecture_bloc/presenatation/screen/general/category/update_category/update_categor.dart'
    as _i13;
import 'package:clean_architecture_bloc/presenatation/screen/general/general.dart'
    as _i5;
import 'package:clean_architecture_bloc/presenatation/screen/general/home/home.dart'
    as _i6;
import 'package:clean_architecture_bloc/presenatation/screen/general/home/home_detail.dart'
    as _i7;
import 'package:clean_architecture_bloc/presenatation/screen/general/home/posts_model.dart'
    as _i21;
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/add_new_tag/add_new_tag.dart'
    as _i2;
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags.dart'
    as _i12;
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart'
    as _i17;
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/update_tag/update_tag.dart'
    as _i14;
import 'package:clean_architecture_bloc/presenatation/screen/onboard/onboard.dart'
    as _i9;
import 'package:clean_architecture_bloc/presenatation/screen/splash/splash_imports.dart'
    as _i11;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCategory(),
      );
    },
    AddTagRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddTag(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Auth(),
      );
    },
    CategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryScreenRouteArgs>();
      return _i15.AutoRoutePage<_i16.Category>(
        routeData: routeData,
        child: _i4.CategoryScreen(
          key: args.key,
          navigateType: args.navigateType,
        ),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.General(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Home(),
      );
    },
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HomeDetail(
          key: args.key,
          post: args.post,
          imgPath: args.imgPath,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnBoard(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Splash(),
      );
    },
    TagsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<TagsScreenRouteArgs>();
      return _i15.AutoRoutePage<_i17.Tags>(
        routeData: routeData,
        child: _i12.TagsScreen(
          key: args.key,
          navigateType: args.navigateType,
        ),
      );
    },
    UpdateCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCategoryRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.UpdateCategory(
          key: args.key,
          id: args.id,
          title: args.title,
        ),
      );
    },
    UpdateTagRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTagRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.UpdateTag(
          key: args.key,
          id: args.id,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i15.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddTag]
class AddTagRoute extends _i15.PageRouteInfo<void> {
  const AddTagRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddTagRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i15.PageRouteInfo<void> {
  const AuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CategoryScreen]
class CategoryScreenRoute extends _i15.PageRouteInfo<CategoryScreenRouteArgs> {
  CategoryScreenRoute({
    _i18.Key? key,
    required _i19.NavigateType navigateType,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CategoryScreenRoute.name,
          args: CategoryScreenRouteArgs(
            key: key,
            navigateType: navigateType,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryScreenRoute';

  static const _i15.PageInfo<CategoryScreenRouteArgs> page =
      _i15.PageInfo<CategoryScreenRouteArgs>(name);
}

class CategoryScreenRouteArgs {
  const CategoryScreenRouteArgs({
    this.key,
    required this.navigateType,
  });

  final _i18.Key? key;

  final _i19.NavigateType navigateType;

  @override
  String toString() {
    return 'CategoryScreenRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i5.General]
class GeneralRoute extends _i15.PageRouteInfo<void> {
  const GeneralRoute({List<_i15.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Home]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeDetail]
class HomeDetailRoute extends _i15.PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    _i20.Key? key,
    required _i21.PostModel post,
    required String imgPath,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            key: key,
            post: post,
            imgPath: imgPath,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const _i15.PageInfo<HomeDetailRouteArgs> page =
      _i15.PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.key,
    required this.post,
    required this.imgPath,
  });

  final _i20.Key? key;

  final _i21.PostModel post;

  final String imgPath;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, post: $post, imgPath: $imgPath}';
  }
}

/// generated route for
/// [_i8.LoginPage]
class LoginPageRoute extends _i15.PageRouteInfo<void> {
  const LoginPageRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoard]
class OnBoardRoute extends _i15.PageRouteInfo<void> {
  const OnBoardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterPage]
class RegisterPageRoute extends _i15.PageRouteInfo<void> {
  const RegisterPageRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RegisterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Splash]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TagsScreen]
class TagsScreenRoute extends _i15.PageRouteInfo<TagsScreenRouteArgs> {
  TagsScreenRoute({
    _i20.Key? key,
    required _i19.NavigateType navigateType,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          TagsScreenRoute.name,
          args: TagsScreenRouteArgs(
            key: key,
            navigateType: navigateType,
          ),
          initialChildren: children,
        );

  static const String name = 'TagsScreenRoute';

  static const _i15.PageInfo<TagsScreenRouteArgs> page =
      _i15.PageInfo<TagsScreenRouteArgs>(name);
}

class TagsScreenRouteArgs {
  const TagsScreenRouteArgs({
    this.key,
    required this.navigateType,
  });

  final _i20.Key? key;

  final _i19.NavigateType navigateType;

  @override
  String toString() {
    return 'TagsScreenRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i13.UpdateCategory]
class UpdateCategoryRoute extends _i15.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    _i18.Key? key,
    required String id,
    required String title,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          UpdateCategoryRoute.name,
          args: UpdateCategoryRouteArgs(
            key: key,
            id: id,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCategoryRoute';

  static const _i15.PageInfo<UpdateCategoryRouteArgs> page =
      _i15.PageInfo<UpdateCategoryRouteArgs>(name);
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({
    this.key,
    required this.id,
    required this.title,
  });

  final _i18.Key? key;

  final String id;

  final String title;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, id: $id, title: $title}';
  }
}

/// generated route for
/// [_i14.UpdateTag]
class UpdateTagRoute extends _i15.PageRouteInfo<UpdateTagRouteArgs> {
  UpdateTagRoute({
    _i20.Key? key,
    required String id,
    required String title,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          UpdateTagRoute.name,
          args: UpdateTagRouteArgs(
            key: key,
            id: id,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTagRoute';

  static const _i15.PageInfo<UpdateTagRouteArgs> page =
      _i15.PageInfo<UpdateTagRouteArgs>(name);
}

class UpdateTagRouteArgs {
  const UpdateTagRouteArgs({
    this.key,
    required this.id,
    required this.title,
  });

  final _i20.Key? key;

  final String id;

  final String title;

  @override
  String toString() {
    return 'UpdateTagRouteArgs{key: $key, id: $id, title: $title}';
  }
}
