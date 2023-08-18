import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/screenshot_carrousel.dart';

class PhoneScreenshotFlowComponent extends StatelessWidget {
  const PhoneScreenshotFlowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
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
        ],
      ),
    );
  }
}
