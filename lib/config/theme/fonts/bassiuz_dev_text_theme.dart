import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'text_scale_extension.dart';

TextTheme bassiuzDevTextTheme(FluidConfig config) => TextTheme(
      displayLarge: config.firaSans.bold.displayLarge,
      displayMedium: config.firaSans.bold.displayMedium,
      displaySmall: config.firaSans.displaySmall,
      headlineLarge: config.firaSans.bold.headlineLarge,
      headlineMedium: config.firaSans.headlineMedium,
      headlineSmall: config.firaSans.headlineSmall,
      bodyLarge: config.firaSans.bodyLarge,
      bodyMedium: config.firaSans.bodyMedium,
      bodySmall: config.firaSans.bodySmall,
    );
