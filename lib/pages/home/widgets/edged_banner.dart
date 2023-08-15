import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/sizes.dart';
import '../../../gen/assets.gen.dart';
import 'edge_painter.dart';

class EdgedBanner extends StatelessWidget {
  const EdgedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          // to prevent thin line just peeking out under the edges
          padding: const EdgeInsets.only(bottom: 1),
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Assets.images.backgroundBassieMinMin.image(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: Sizes.teethSize,
            width: double.infinity,
            child: CustomPaint(
              painter: EdgePainter(seed: Random().nextInt(100000000)),
            ),
          ),
        ),
      ],
    );
  }
}
