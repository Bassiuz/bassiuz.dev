import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import 'components/banner_component.dart';
import 'components/blog_component.dart';
import 'components/introduction_component.dart';
import 'components/menu_bar_component.dart';
import 'components/soclals_component.dart';
import 'widgets/scrolling/inherited_list_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      selectionControls: materialTextSelectionControls,
      focusNode: FocusNode(),
      child: InheritedListView(
        child: Scaffold(body: Builder(builder: (ctx) {
          return Stack(
            children: [
              ListViewObserver(
                onObserve: (resultModel) {
                  InheritedListView.maybeOf(ctx)?.scrollManager.visibleItems.add(resultModel.displayingChildIndexList);
                },
                child: ListView(
                  controller: InheritedListView.maybeOf(ctx)?.scrollManager.scrollController,
                  children: const [
                    BannerComponent(),
                    IntroductionComponent(),
                    BlogComponent(indexInScroll: 2),
                    SocialsComponent(indexInScroll: 3),
                  ],
                ),
              ),
              const MenuBarComponent(),
            ],
          );
        })),
      ),
    );
  }
}
