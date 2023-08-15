import 'package:flutter/material.dart';

import 'scroll_manager.dart';

class InheritedListView extends InheritedWidget {
  InheritedListView({
    super.key,
    required super.child,
  });

  final ScrollManager scrollManager = ScrollManager();

  static InheritedListView? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedListView>();
  }

  @override
  bool updateShouldNotify(covariant InheritedListView oldWidget) => scrollManager != oldWidget.scrollManager;
}
