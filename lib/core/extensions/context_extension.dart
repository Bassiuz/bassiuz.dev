import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  VoidCallback? navigateToRouteIfNotOnRoute(PageRouteInfo route) =>
      router.current.name != route.routeName ? () => router.push(route) : null;
}
