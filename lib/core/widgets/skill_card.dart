import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../pages/home/components/skill_grid_component.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skill,
  });

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(context.fluid.spaces.s),
        child: Column(
          children: [
            Row(
              children: [
                Icon(skill.icon, size: context.fluid.spaces.xl),
                SizedBox(
                  width: context.fluid.spaces.xs,
                ),
                Text(skill.title, style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            Text(skill.description),
          ],
        ),
      ),
    );
  }
}
