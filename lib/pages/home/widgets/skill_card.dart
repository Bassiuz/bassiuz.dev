import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: SizedBox(height: 80, child: Card(child: Text('Skill Card'))));
  }
}
