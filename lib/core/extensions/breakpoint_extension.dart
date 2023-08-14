import 'package:flutter/material.dart';

extension BreakpointExtension on BuildContext {
  bool get verySmall => MediaQuery.sizeOf(this).width < 400;
}
