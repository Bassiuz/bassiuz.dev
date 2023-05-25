// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:bassiuz_dev/pages/blogpost/blogpost_page.dart' as _i3;
import 'package:bassiuz_dev/pages/design/design_showcase_page.dart' as _i2;
import 'package:bassiuz_dev/pages/home/home_page.dart' as _i1;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    DesignShowcaseRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DesignShowcasePage(),
      );
    },
    BlogpostRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BlogpostPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DesignShowcasePage]
class DesignShowcaseRoute extends _i4.PageRouteInfo<void> {
  const DesignShowcaseRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DesignShowcaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'DesignShowcaseRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BlogpostPage]
class BlogpostRoute extends _i4.PageRouteInfo<void> {
  const BlogpostRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BlogpostRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogpostRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
