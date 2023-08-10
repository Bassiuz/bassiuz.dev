import 'dart:math';

import 'package:flutter/material.dart';

class PhoneLayerWidget extends StatelessWidget {
  const PhoneLayerWidget(
      {super.key,
      required this.phoneLayerContent,
      required this.bottomPadding,
      required this.percentageVisible,
      required this.totalHeight,
      required this.scrollFactor});

  final Widget phoneLayerContent;
  final double bottomPadding;
  final double percentageVisible;
  final double totalHeight;
  final double scrollFactor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: SingleChildScrollView(
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              phoneLayerContent,
              SizedBox(height: bottomPadding),
              AnimatedContainer(
                  curve: Curves.linearToEaseOut,
                  duration: const Duration(milliseconds: 5000),
                  height: max(0, scrollFactor * totalHeight * (100 - percentageVisible) / 100)),
            ],
          ),
        ),
      ),
    );
  }
}
