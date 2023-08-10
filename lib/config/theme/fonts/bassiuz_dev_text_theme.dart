import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme bassiuzDevTextTheme(FluidConfig config) => TextTheme(
      displayLarge: config.fromGoogleFont(GoogleFonts.rubik).bold.displayLarge.copyWith(color: Colors.white),
      displayMedium: config.fromGoogleFont(GoogleFonts.rubik).bold.displayMedium.copyWith(color: Colors.white),
      displaySmall: config.fromGoogleFont(GoogleFonts.rubik).bold.displaySmall.copyWith(color: Colors.white),
      headlineLarge: config.fromGoogleFont(GoogleFonts.rubik).bold.headlineLarge,
      headlineMedium: config.fromGoogleFont(GoogleFonts.rubik).headlineMedium,
      headlineSmall: config.fromGoogleFont(GoogleFonts.rubik).headlineSmall,
      bodyLarge: config.fromGoogleFont(GoogleFonts.rubik).bodyLarge,
      bodyMedium: config.fromGoogleFont(GoogleFonts.rubik).bodyMedium,
      bodySmall: config.fromGoogleFont(GoogleFonts.rubik).bodySmall,
    );
