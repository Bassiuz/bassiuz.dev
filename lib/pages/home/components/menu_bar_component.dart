import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/scrolling/inherited_list_view.dart';

class MenuBarComponent extends StatefulWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  ScrollController? _scrollController;

  bool showMenuBar = false;

  void initScrollListener() {
    setState(() {
      _scrollController = InheritedListView.maybeOf(context)!.scrollManager.scrollController;
      _scrollController!.addListener(() => setState(() {
            _scrollController!.offset > 0 ? showMenuBar = true : showMenuBar = false;
          }));
    });
  }

  @override
  void didChangeDependencies() {
    initScrollListener();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: showMenuBar ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(0.2),
              title: const Text('Glassmorphism AppBar'),
              leading: const Icon(Icons.chevron_left),
              elevation: 0.0,
            ),
          ),
        ),
      ),
    );
  }
}
