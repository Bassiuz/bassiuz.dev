import 'package:flutter/material.dart';

import 'scrolling/inherited_list_view.dart';

class VisibleWidgetBuilder extends StatefulWidget {
  const VisibleWidgetBuilder({
    super.key,
    required this.builder,
    required this.indexInScroll,
  });

  final Widget Function(BuildContext context, bool visible) builder;
  final int indexInScroll;

  @override
  State<VisibleWidgetBuilder> createState() => _VisibleWidgetBuilderState();
}

class _VisibleWidgetBuilderState extends State<VisibleWidgetBuilder> {
  bool visible = false;

  void initScrollListener() {
    InheritedListView.maybeOf(context)!.scrollManager.visibleItems.stream.listen((event) {
      mounted ? setState(() => visible = event.contains(widget.indexInScroll)) : null;
    });
  }

  @override
  void didChangeDependencies() {
    initScrollListener();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) => widget.builder(context, visible));
  }
}
