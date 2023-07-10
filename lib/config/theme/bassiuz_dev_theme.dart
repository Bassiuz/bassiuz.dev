import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'fonts/bassiuz_dev_text_theme.dart';

ThemeData bassiuzDevTheme(BuildContext context) => ThemeData(
      textTheme: bassiuzDevTextTheme(fluidConfig(context)),
      useMaterial3: true,
      extensions: <ThemeExtension<dynamic>>[fluidConfig(context)],
    );

FluidConfig fluidConfig(BuildContext context) => FluidConfig.fromContext(context);
