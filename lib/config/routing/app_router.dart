import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page, path: '/'),
        AutoRoute(page: BlogpostRoute.page, path: '/b/:blogSlug'),
        AutoRoute(page: BlogsRoute.page, path: '/blogs'),
      ];
}