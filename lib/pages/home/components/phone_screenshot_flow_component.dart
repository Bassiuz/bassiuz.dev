import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../widgets/screenshot_carrousel.dart';

class PhoneScreenshotFlowComponent extends StatelessWidget {
  const PhoneScreenshotFlowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
          ),
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const ScreenshotCarrousel(),
          Container(
              color: Colors.black38,
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(context.fluid.spaces.m),
                  child: Text(
                    '"I\'ve developed my first mobile app over 10 years ago, and never lost the love for mobile since!"',
                    style: context.theme.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
