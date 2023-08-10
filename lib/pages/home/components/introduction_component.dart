import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../widgets/titled_text_widget.dart';

class IntroductionComponent extends StatelessWidget {
  const IntroductionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.fluid.spaces.m),
      child: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.fluid.viewportConfig.maxViewportSize),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Assets.images.bassie.image(
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: context.fluid.spaces.s,
              ),
              const Flexible(flex: 3, child: TiltedTextWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
