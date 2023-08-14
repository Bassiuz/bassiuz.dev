import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../widgets/max_width_wrapper.dart';
import '../widgets/skill_card.dart';
import '../widgets/visible_widget.dart';

class SkillGridComponent extends StatelessWidget {
  const SkillGridComponent({super.key, required this.indexInScroll});

  final int indexInScroll;

  @override
  Widget build(BuildContext context) {
    return MaxWidthWrapper(
      child: VisibleWidgetBuilder(
        indexInScroll: indexInScroll,
        builder: (context, visible) => MaxWidthWrapper(
          child: Padding(
            padding: EdgeInsets.all(context.fluid.spaces.m),
            child: Column(
              children: [
                SizedBox(height: context.fluid.spaces.s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SkillCard(),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    const SkillCard(),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    const SkillCard(),
                  ],
                ),
                SizedBox(height: context.fluid.spaces.s),
                Row(
                  children: [
                    const SkillCard(),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    const SkillCard(),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    const SkillCard(),
                  ],
                ),
                SizedBox(height: context.fluid.spaces.s),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
