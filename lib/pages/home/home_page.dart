import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import 'components/banner_component.dart';
import 'components/blog_component.dart';
import 'components/confessional_component.dart';
import 'components/footer_component.dart';
import 'components/introduction_component.dart';
import 'components/menu_bar_component.dart';
import 'components/phone_screenshot_flow_component.dart';
import 'components/skill_grid_component.dart';
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
                  cacheExtent: 1000000,
                  controller: InheritedListView.maybeOf(ctx)?.scrollManager.scrollController,
                  children: [
                    const BannerComponent(),
                    SizedBox(height: context.fluid.spaces.m),
                    const IntroductionComponent(),
                    SizedBox(height: context.fluid.spaces.xxl),
                    const BlogComponent(indexInScroll: 4),
                    SizedBox(height: context.fluid.spaces.l),
                    const SocialsComponent(indexInScroll: 6),
                    SizedBox(height: context.fluid.spaces.xxl),
                    const SkillGridComponent(indexInScroll: 8),
                    SizedBox(height: context.fluid.spaces.xxl),
                    const PhoneScreenshotFlowComponent(),
                    SizedBox(height: context.fluid.spaces.xxl),
                    const ConfessionalComponent(),
                    SizedBox(height: context.fluid.spaces.xxl),
                    const FooterComponent(),
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
