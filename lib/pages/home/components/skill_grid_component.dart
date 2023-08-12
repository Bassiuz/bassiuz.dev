import 'package:flutter/material.dart';

import '../widgets/visible_widget.dart';

class SkillGridComponent extends StatelessWidget {
  const SkillGridComponent({super.key, required this.indexInScroll});

  final int indexInScroll;

  @override
  Widget build(BuildContext context) {
    return VisibleWidgetBuilder(
        indexInScroll: indexInScroll,
        builder: ((context, visible) => AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 200,
              width: double.infinity,
              color: visible ? Colors.red : Colors.white,
            )));
  }
}
