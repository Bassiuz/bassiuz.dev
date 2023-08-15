import 'dart:math';

import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import 'screenshot_card_widget.dart';

class ScreenshotCarrousel extends StatefulWidget {
  const ScreenshotCarrousel({super.key});

  @override
  State<ScreenshotCarrousel> createState() => _ScreenshotCarrouselState();
}

List<AssetGenImage> screenshots = [
  Assets.images.screenshot1MinMin,
  Assets.images.screenshot2MinMin,
  Assets.images.screenshot3MinMin,
  Assets.images.screenshot4MinMin,
  Assets.images.screenshot5MinMin,
  Assets.images.screenshot6MinMin,
  Assets.images.screenshot7MinMin,
  Assets.images.screenshot8MinMin,
];

class _ScreenshotCarrouselState extends State<ScreenshotCarrousel> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  int amountOfSteps = 100000;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    setStateUpdaterAndRepeat();

    _animation = IntTween(begin: 0, end: amountOfSteps).animate(_animationController);
    _animation.addListener(() => setState(() {}));
  }

  void setStateUpdaterAndRepeat() {
    _animationController
      ..forward(from: 0)
      ..addListener(() {
        if (_animationController.isCompleted) {
          setState(() {
            if (currentIndex == 0) {
              currentIndex = screenshots.length - 1;
            } else {
              currentIndex = currentIndex - 1;
            }
          });
          setStateUpdaterAndRepeat();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenshotWidth = max(200, MediaQuery.sizeOf(context).width / 5);

    return ClipRRect(
      child: Transform.rotate(
        angle: -0.1,
        child: OverflowBox(
          alignment: Alignment.centerLeft,
          maxWidth: (screenshotWidth) * 10,
          maxHeight: 600,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: (screenshotWidth + context.fluid.spaces.m) * (_animation.value) / amountOfSteps,
                child: OverflowBox(
                  alignment: Alignment.centerRight,
                  maxWidth: screenshotWidth + context.fluid.spaces.m,
                  child: Row(children: [
                    ScreenshotCardWidget(
                      width: screenshotWidth,
                      index: currentIndex,
                    ),
                    SizedBox(width: context.fluid.spaces.m),
                  ]),
                ),
              ),
              for (int i = 0; i < 5; i++) ...[
                ScreenshotCardWidget(
                  width: screenshotWidth,
                  index: (currentIndex + i + 1) % screenshots.length,
                ),
                SizedBox(width: context.fluid.spaces.m),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
