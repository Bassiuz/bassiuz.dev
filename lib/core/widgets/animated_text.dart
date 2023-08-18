import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String currentText = 'Software Developer';
  String nextText = 'Software Developer';
  bool visible = true;

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
    Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        visible = !visible;
      });
    });
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
    return Text.rich(
      TextSpan(
        text: currentText,
        style: context.theme.textTheme.displaySmall,
        children: [
          TextSpan(
            text: '_',
            style: context.theme.textTheme.displaySmall!.copyWith(color: visible ? null : Colors.transparent),
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
