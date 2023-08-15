import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/extensions/breakpoint_extension.dart';
import '../widgets/grid.dart';
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
        builder: (context, visible) => Padding(
          padding: EdgeInsets.all(context.fluid.spaces.m),
          child: Grid(
              crossAxisCount: context.small ? 1 : 2,
              children: Skill.values.map((skill) => SkillCard(skill: skill)).toList()),
        ),
      ),
    );
  }
}

enum Skill {
  openSource(Ionicons.code_working_outline, 'Open Source',
      'I love open source and I try to contribute to it as much as I can.'),
  flutter(Ionicons.phone_portrait_outline, 'Flutter',
      'Mobile Development is my passion, and I\'m currently focussing on Flutter & Dart.'),
  publicSpeaking(Ionicons.megaphone_outline, 'Public Speaking',
      'I love to share my knowledge with others, and I\'m always looking for opportunities to do so.'),
  experience(Ionicons.time_outline, 'Experience',
      'The start of my Software Development career is over 10 years ago now, and I\'ve worked on a lot of different projects.'),
  meetups(Ionicons.people_outline, 'Meetups',
      'Visiting meetups, meeting new people and learning about what they\'re doing is something I love to do!'),
  writing(
      Ionicons.pencil_outline, 'Writing', 'I love to write about my experiences, and blog and tweet a lot about it.');

  const Skill(this.icon, this.title, this.description);

  final IconData icon;
  final String title;
  final String description;
}
