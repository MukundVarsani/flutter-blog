import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_bloc/presenatation/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: OnBoardRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: LoginPageRoute.page),
        AutoRoute(page: RegisterPageRoute.page),
        AutoRoute(page: GeneralRoute.page, path: '/general'),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HomeDetailRoute.page),
        AutoRoute(page: TagsScreenRoute.page),
        AutoRoute(page: CategoryScreenRoute.page),
      ];
}
