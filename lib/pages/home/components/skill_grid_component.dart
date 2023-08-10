import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class SkillGridComponent extends StatelessWidget {
  const SkillGridComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.fluid.viewportConfig.maxViewportSize,
        ),
        child: const SizedBox(height: 200),
      ),
    );
  }
}
