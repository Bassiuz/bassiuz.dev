import 'dart:ui';

import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/extensions/breakpoint_extension.dart';
import '../../../core/extensions/context_extension.dart';
import '../widgets/circle_hover_inkwell.dart';
import '../widgets/scrolling/inherited_list_view.dart';

class MenuBarComponent extends StatefulWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  ScrollController? _scrollController;

  bool showMenuBar = false;

  bool expandMenuBar = false;

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
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50 + MediaQuery.of(context).padding.top,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.l),
                    child: Row(
                      children: [
                        CircleHoverInkwell(
                          onClick: () => {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.s),
                            child: Text(
                              'B@sdevaan.nl',
                              style: context.theme.textTheme.titleLarge!
                                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (!context.verySmall) ...{
                          CircleHoverInkwell(
                            onClick: () => {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.s),
                              child: Text(
                                'Blog',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: context.fluid.spaces.m),
                          CircleHoverInkwell(
                            onClick: () => {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.s),
                              child: Text(
                                'Playground',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        },
                        if (context.verySmall) ...{
                          CircleHoverInkwell(
                              onClick: () => setState(() {
                                    expandMenuBar = !expandMenuBar;
                                  }),
                              child: Icon(expandMenuBar ? Ionicons.close_outline : Ionicons.menu_outline,
                                  color: Colors.white, size: 30)),
                        },
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: expandMenuBar && context.verySmall ? 80 : 0,
            color: Colors.black.withOpacity(0.2),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleHoverInkwell(
                          onClick: () => {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.s),
                            child: Text(
                              'Blog',
                              style: context.theme.textTheme.titleMedium!
                                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        CircleHoverInkwell(
                          onClick: () => {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.s),
                            child: Text(
                              'Playground',
                              style: context.theme.textTheme.titleMedium!
                                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}