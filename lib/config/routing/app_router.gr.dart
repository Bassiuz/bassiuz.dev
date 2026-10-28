// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:bassiuz_dev/pages/ai/ai_page.dart' as _i1;
import 'package:bassiuz_dev/pages/blogpost/blogpost_page.dart' as _i2;
import 'package:bassiuz_dev/pages/blogs/blogs_page.dart' as _i3;
import 'package:bassiuz_dev/pages/fluid_ui_playground/fluid_ui_playground_page.dart'
    as _i4;
import 'package:bassiuz_dev/pages/home/home_page.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AiRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AiRouteArgs>(
          orElse: () => AiRouteArgs(lang: pathParams.getString('lang')));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AiPage(
          key: args.key,
          lang: args.lang,
        ),
      );
    },
    BlogpostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BlogpostRouteArgs>(
          orElse: () =>
              BlogpostRouteArgs(blogSlug: pathParams.getString('blogSlug')));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BlogpostPage(
          key: args.key,
          blogSlug: args.blogSlug,
        ),
      );
    },
    BlogsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BlogsPage(),
      );
    },
    FluidUIPlaygroundRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FluidUIPlaygroundPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AiPage]
class AiRoute extends _i6.PageRouteInfo<AiRouteArgs> {
  AiRoute({
    _i7.Key? key,
    required String lang,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AiRoute.name,
          args: AiRouteArgs(
            key: key,
            lang: lang,
          ),
          rawPathParams: {'lang': lang},
          initialChildren: children,
        );

  static const String name = 'AiRoute';

  static const _i6.PageInfo<AiRouteArgs> page = _i6.PageInfo<AiRouteArgs>(name);
}

class AiRouteArgs {
  const AiRouteArgs({
    this.key,
    required this.lang,
  });

  final _i7.Key? key;

  final String lang;

  @override
  String toString() {
    return 'AiRouteArgs{key: $key, lang: $lang}';
  }
}

/// generated route for
/// [_i2.BlogpostPage]
class BlogpostRoute extends _i6.PageRouteInfo<BlogpostRouteArgs> {
  BlogpostRoute({
    _i7.Key? key,
    required String blogSlug,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<BlogpostRouteArgs> page =
      _i6.PageInfo<BlogpostRouteArgs>(name);
}

class BlogpostRouteArgs {
  const BlogpostRouteArgs({
    this.key,
    required this.blogSlug,
  });

  final _i7.Key? key;

  final String blogSlug;

  @override
  String toString() {
    return 'BlogpostRouteArgs{key: $key, blogSlug: $blogSlug}';
  }
}

/// generated route for
/// [_i3.BlogsPage]
class BlogsRoute extends _i6.PageRouteInfo<void> {
  const BlogsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BlogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FluidUIPlaygroundPage]
class FluidUIPlaygroundRoute extends _i6.PageRouteInfo<void> {
  const FluidUIPlaygroundRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FluidUIPlaygroundRoute.name,
          initialChildren: children,
        );

  static const String name = 'FluidUIPlaygroundRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
