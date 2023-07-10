import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String currentText = 'Software Developer';
  String nextText = 'Software Developer';

  static const List<String> availableTexts = [
    'Software Developer',
    'Internet Nerd',
    'Internet Browser',
    'Cheese- & Hagelslaglover',
    'Cheesy joketeller',
    'Flutter Developer',
    'Flutter Enthusiast',
    'Mobile Connaiseur',
    'Mobile Developer',
    'Magic the Gathering player'
  ];

  @override
  void initState() {
    super.initState();
    setNextCharacterDelayed();
  }

  void setNextCharacterDelayed() {
    if (!mounted) {
      return;
    }

    if (currentText == nextText) {
      setState(() {
        nextText = availableTexts[Random().nextInt(availableTexts.length)];
      });

      Future<void>.delayed(const Duration(milliseconds: 4000)).then((_) => setNextCharacterDelayed());
    } else {
      if (nextText.startsWith(currentText)) {
        setState(() {
          currentText = nextText.substring(0, currentText.length + 1);
        });
      } else {
        setState(() {
          currentText = currentText.substring(0, currentText.length - 1);
        });
      }

      Future<void>.delayed(const Duration(milliseconds: 100)).then((_) => setNextCharacterDelayed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${currentText}_',
      style: context.theme.textTheme.headlineMedium,
    );
  }
}
