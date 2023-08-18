// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:bassiuz_dev/pages/blogpost/blogpost_page.dart' as _i2;
import 'package:bassiuz_dev/pages/home/home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    BlogpostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BlogpostRouteArgs>(
          orElse: () =>
              BlogpostRouteArgs(blogSlug: pathParams.getString('blogSlug')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BlogpostPage(
          key: args.key,
          blogSlug: args.blogSlug,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BlogpostPage]
class BlogpostRoute extends _i3.PageRouteInfo<BlogpostRouteArgs> {
  BlogpostRoute({
    _i4.Key? key,
    required String blogSlug,
    List<_i3.PageRouteInfo>? children,
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

  static const _i3.PageInfo<BlogpostRouteArgs> page =
      _i3.PageInfo<BlogpostRouteArgs>(name);
}

class BlogpostRouteArgs {
  const BlogpostRouteArgs({
    this.key,
    required this.blogSlug,
  });

  final _i4.Key? key;

  final String blogSlug;

  @override
  String toString() {
    return 'BlogpostRouteArgs{key: $key, blogSlug: $blogSlug}';
  }
}
