import 'package:clean_architecture_bloc/core/theme/app_theme.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/CategoryCubit/CategorylCubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/ImageCubit/imageCubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/PostCubit/post_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/TagsCubit/TagsCubit.dart';
import 'package:clean_architecture_bloc/presenatation/bloc/userpostCubit/userpost_cubit.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.dart';
import 'package:clean_architecture_bloc/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => TagsCubit(),
      ),
      BlocProvider(
        create: (context) => PostCubit(),
      ),
      BlocProvider(
        create: (context) => UserPostsCubit(),
      ),
      BlocProvider(
        create: (context) => CategoryCubit(),
      ),
      BlocProvider(
        create: (context) => ImageCubit(),
      ),
    ],
    child: MyApp(),
  ));

  print(await Utils.getToken());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Journo',
            theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.dark,
            routerConfig: _appRouter.config(),
          );
        });
  }
}
