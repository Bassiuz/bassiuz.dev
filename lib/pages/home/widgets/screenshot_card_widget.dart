import 'package:flutter/material.dart';

import 'screenshot_carrousel.dart';

class ScreenshotCardWidget extends StatelessWidget {
  const ScreenshotCardWidget({super.key, required this.index, required this.width});
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    return screenshots[index].image(key: ValueKey(index), width: width, fit: BoxFit.fitWidth);
  }
}
