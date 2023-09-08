// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:bassiuz_dev/pages/blogpost/blogpost_page.dart' as _i1;
import 'package:bassiuz_dev/pages/blogs/blogs_page.dart' as _i2;
import 'package:bassiuz_dev/pages/fluid_ui_playground/fluid_ui_playground_page.dart'
    as _i3;
import 'package:bassiuz_dev/pages/home/home_page.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BlogpostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BlogpostRouteArgs>(
          orElse: () =>
              BlogpostRouteArgs(blogSlug: pathParams.getString('blogSlug')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BlogpostPage(
          key: args.key,
          blogSlug: args.blogSlug,
        ),
      );
    },
    BlogsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BlogsPage(),
      );
    },
    FluidUIPlaygroundRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FluidUIPlaygroundPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogpostPage]
class BlogpostRoute extends _i5.PageRouteInfo<BlogpostRouteArgs> {
  BlogpostRoute({
    _i6.Key? key,
    required String blogSlug,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BlogpostRoute.name,
          args: BlogpostRouteArgs(
            key: key,
            blogSlug: blogSlug,
          ),
          rawPathParams: {'blogSlug': blogSlug},
          initialChildren: children,
        );

  static const String name = 'BlogpostRoute';

  static const _i5.PageInfo<BlogpostRouteArgs> page =
      _i5.PageInfo<BlogpostRouteArgs>(name);
}

class BlogpostRouteArgs {
  const BlogpostRouteArgs({
    this.key,
    required this.blogSlug,
  });

  final _i6.Key? key;

  final String blogSlug;

  @override
  String toString() {
    return 'BlogpostRouteArgs{key: $key, blogSlug: $blogSlug}';
  }
}

/// generated route for
/// [_i2.BlogsPage]
class BlogsRoute extends _i5.PageRouteInfo<void> {
  const BlogsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BlogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FluidUIPlaygroundPage]
class FluidUIPlaygroundRoute extends _i5.PageRouteInfo<void> {
  const FluidUIPlaygroundRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FluidUIPlaygroundRoute.name,
          initialChildren: children,
        );

  static const String name = 'FluidUIPlaygroundRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
