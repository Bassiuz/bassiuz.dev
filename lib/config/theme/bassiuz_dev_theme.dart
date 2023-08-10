import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'fonts/bassiuz_dev_text_theme.dart';

ThemeData bassiuzDevTheme(BuildContext context) => ThemeData(
      textTheme: bassiuzDevTextTheme(fluidConfig(context)),
      useMaterial3: true,
      colorScheme: const ColorScheme.light(),
      extensions: <ThemeExtension<dynamic>>[fluidConfig(context)],
    );

FluidConfig fluidConfig(BuildContext context) => FluidConfig.fromContext(context,
    typeConfig: const TypeConfig(
      minBaseFontSize: 10,
      maxBaseFontSize: 12,
      minTypeScaleModifier: 1.15,
      maxTypeScaleModifier: 1.25,
    ),
    viewportConfig: const ViewportConfig(maxViewportSize: 1200));
