import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class TiltedTextWidget extends StatelessWidget {
  const TiltedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(text: 'I\'m ', children: [
            TextSpan(
              text: 'Bas de Vaan',
              style: context.theme.textTheme.headlineLarge,
            ),
          ]),
          style: context.theme.textTheme.headlineMedium,
        ),
        Text(
          'Software Developer',
          style: context.theme.textTheme.headlineMedium,
        ),
        const Divider(),
        Text(
          'Lorum ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: context.theme.textTheme.bodySmall,
        ),
        Text(
          'Lorum ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.',
          style: context.theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
