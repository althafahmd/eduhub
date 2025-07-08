import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: HomeRoute.page, path: '/home-screen'),
    AutoRoute(page: ModuleRoute.page, path: '/module-screen'),
    AutoRoute(page: VideoRoute.page, path: '/video-screen'),
  ];
}
