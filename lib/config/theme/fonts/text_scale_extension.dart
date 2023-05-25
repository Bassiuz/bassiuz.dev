import 'dart:ui';

import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
//import google fonts
import 'package:google_fonts/google_fonts.dart';

import 'text_scale_helper.dart';

extension TextScaleExtension on ThemeData {
  TextScaleHelper get firaSans => extension<FluidConfig>()!.firaSans;
  TextScaleHelper get firaMono => extension<FluidConfig>()!.firaMono;
  TextScaleHelper fromGoogleFont(
          TextStyle Function({
            TextStyle? textStyle,
            Color? color,
            Color? backgroundColor,
            double? fontSize,
            FontWeight? fontWeight,
            FontStyle? fontStyle,
            double? letterSpacing,
            double? wordSpacing,
            TextBaseline? textBaseline,
            double? height,
            Locale? locale,
            Paint? foreground,
            Paint? background,
            List<Shadow>? shadows,
            List<FontFeature>? fontFeatures,
            TextDecoration? decoration,
            Color? decorationColor,
            TextDecorationStyle? decorationStyle,
            double? decorationThickness,
          }) googleFontFunction) =>
      extension<FluidConfig>()!.fromGoogleFont(googleFontFunction);
}

extension TextScaleConfigExtension on FluidConfig {
  TextScaleHelper get firaSans => TextScaleHelper(
      this,
      ({required FontWeight fontWeight, required double fontSize, Color color = Colors.blue}) => GoogleFonts.firaSans(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
          ));

  TextScaleHelper get firaMono => TextScaleHelper(
      this,
      ({required FontWeight fontWeight, required double fontSize, required Color color}) => GoogleFonts.firaMono(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
          ));

  TextScaleHelper fromGoogleFont(
      TextStyle Function({
        TextStyle? textStyle,
        Color? color,
        Color? backgroundColor,
        double? fontSize,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        double? letterSpacing,
        double? wordSpacing,
        TextBaseline? textBaseline,
        double? height,
        Locale? locale,
        Paint? foreground,
        Paint? background,
        List<Shadow>? shadows,
        List<FontFeature>? fontFeatures,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) googleFontFunction) {
    return TextScaleHelper(
      this,
      ({required FontWeight fontWeight, required double fontSize, required Color color}) =>
          googleFontFunction(fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}
