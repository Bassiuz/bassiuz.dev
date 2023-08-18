import 'dart:math';

import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class MaxWidthWrapper extends StatelessWidget {
  const MaxWidthWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: min(context.fluid.viewportConfig.maxViewportSize, MediaQuery.sizeOf(context).width)),
        child: child,
      ),
    );
  }
}
