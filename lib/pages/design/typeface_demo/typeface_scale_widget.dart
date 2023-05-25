import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/fonts/text_scale_helper.dart';
import '../../../core/widget_list_extension.dart';
import 'typeface_widget.dart';

class TypefaceScaleWidget extends StatelessWidget {
  const TypefaceScaleWidget({super.key, required this.textScaleHelper});

  final TextScaleHelper textScaleHelper;
  final String testTextString = 'The quick brown fox jumps over the lazy dog';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.fluid.spaces.m),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypefaceWidget(
                textStyle: textScaleHelper.displayLarge,
                textStyleName: 'Display Large',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.displayMedium,
                textStyleName: 'Display Medium',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.displaySmall,
                textStyleName: 'Display Small',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.headlineLarge,
                textStyleName: 'Headline Large',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.headlineMedium,
                textStyleName: 'Headline Medium',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.headlineSmall,
                textStyleName: 'Headline Small',
                testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.bodyLarge, textStyleName: 'Body Large', testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.bodyMedium, textStyleName: 'Body Medium', testTextString: testTextString),
            TypefaceWidget(
                textStyle: textScaleHelper.bodySmall, textStyleName: 'Body Small', testTextString: testTextString),
          ].withSeperator(SizedBox(
            height: context.fluid.spaces.l,
          ))
            ..removeLast()),
    );
  }
}
