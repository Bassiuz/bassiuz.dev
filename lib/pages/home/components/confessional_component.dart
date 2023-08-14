import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../widgets/max_width_wrapper.dart';
import '../widgets/titled_text_widget.dart';

class ConfessionalComponent extends StatelessWidget {
  const ConfessionalComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.fluid.spaces.m),
      child: Align(
        alignment: Alignment.center,
        child: MaxWidthWrapper(
          child: Row(
            children: [
              const Flexible(flex: 3, child: TiltedTextWidget()),
              SizedBox(
                width: context.fluid.spaces.s,
              ),
              Flexible(
                flex: 2,
                child: Assets.images.bassie.image(
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
