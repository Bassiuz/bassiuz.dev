import 'package:flutter/material.dart';

class TypefaceWidget extends StatelessWidget {
  final TextStyle textStyle;
  final String textStyleName;
  final String testTextString;

  const TypefaceWidget({super.key, required this.textStyle, required this.textStyleName, required this.testTextString});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(testTextString, style: textStyle),
        const Divider(),
        Row(
          children: [
            Expanded(child: Text(textStyleName, style: Theme.of(context).textTheme.bodySmall)),
            Text(textStyle.fontFamily!, style: Theme.of(context).textTheme.bodySmall),
            Text(textStyle.fontWeight.toString(), style: Theme.of(context).textTheme.bodySmall),
            Text(textStyle.fontSize.toString(), style: Theme.of(context).textTheme.bodySmall),
          ],
        )
      ],
    );
  }
}
