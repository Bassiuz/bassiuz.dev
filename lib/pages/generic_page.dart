import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../core/widgets/scrolling/inherited_list_view.dart';
import 'home/components/footer_component.dart';
import 'home/components/menu_bar_component.dart';

class GenericPage extends StatefulWidget {
  const GenericPage({super.key, required this.children});

  final List<Widget> children;

  @override
  State<GenericPage> createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
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
                  children: [
                    ...widget.children,
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
