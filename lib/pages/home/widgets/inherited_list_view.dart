import 'package:flutter/material.dart';

class InheritedListView extends InheritedWidget {
  InheritedListView({
    super.key,
    required super.child,
  });

  final ScrollController scrollController = ScrollController();

  static InheritedListView? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedListView>();
  }

  @override
  bool updateShouldNotify(covariant InheritedListView oldWidget) => scrollController != oldWidget.scrollController;
}
