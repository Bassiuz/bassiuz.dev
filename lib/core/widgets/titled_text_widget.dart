import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

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
          '''Welcome to my digital realm, where code and creativity converge! I'm Bas de Vaan, a passionate Flutter developer on a mission to weave digital magic into every mobile experience. 
          
With over 10 years of (app) development experience, I'm here to teach and help you turn your app dreams into captivating reality.

But that's not all – beyond the lines of code, I'm a self-proclaimed Magic: the Gathering sorcerer with a penchant for mastering off-grid strategies. By day, you'll find me conjuring elegant Flutter solutions at Dutch Coding Company, where I'm constantly pushing the boundaries of what's possible in mobile development.
          ''',
          style: context.theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
