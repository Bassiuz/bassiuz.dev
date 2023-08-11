import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../widgets/scrolling/inherited_list_view.dart';

class SkillGridComponent extends StatefulWidget {
  const SkillGridComponent({super.key});

  @override
  State<SkillGridComponent> createState() => _SkillGridComponentState();
}

class _SkillGridComponentState extends State<SkillGridComponent> {
  bool visible = false;

  void initScrollListener() {
    InheritedListView.maybeOf(context)!.scrollManager.visibleItems.stream.listen((event) {
      setState(() => visible = event.contains(2));
    });
  }

  @override
  void didChangeDependencies() {
    initScrollListener();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.fluid.viewportConfig.maxViewportSize,
        ),
        child: AnimatedContainer(
          height: 200,
          width: double.infinity,
          color: visible ? Colors.red : Colors.white,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
