import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text_scale_extension.dart';

TextTheme bassiuzDevTextTheme(FluidConfig config) => TextTheme(
      displayLarge: config.fromGoogleFont(GoogleFonts.rubik).bold.displayLarge,
      displayMedium: config.fromGoogleFont(GoogleFonts.rubik).bold.displayMedium,
      displaySmall: config.fromGoogleFont(GoogleFonts.rubik).displaySmall,
      headlineLarge: config.fromGoogleFont(GoogleFonts.rubik).bold.headlineLarge,
      headlineMedium: config.fromGoogleFont(GoogleFonts.rubik).headlineMedium.copyWith(color: Colors.white),
      headlineSmall: config.fromGoogleFont(GoogleFonts.rubik).headlineSmall,
      bodyLarge: config.fromGoogleFont(GoogleFonts.rubik).bodyLarge,
      bodyMedium: config.fromGoogleFont(GoogleFonts.rubik).bodyMedium,
      bodySmall: config.fromGoogleFont(GoogleFonts.rubik).bodySmall,
    );
