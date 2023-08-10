import 'dart:math';

import 'package:flutter/material.dart';

class EdgePainter extends CustomPainter {
  EdgePainter({this.segments = 8});

  final int segments;
  Path path = Path();
  Paint paintObject = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    double currentHeight = 0;

    path = Path();
    paintObject = Paint();

    List<int> segmentParts = [];
    int total = 0;

    for (var i = 0; i < segments; i++) {
      int value = Random().nextInt(30) + 100;
      segmentParts.add(value);
      total += value;
    }

    for (var i = 0; i < segments; i++) {
      int sumBeforeIndex = segmentParts.sublist(0, i).fold(0, (p, c) => p + c);
      int sumAfterIndex = segmentParts.sublist(0, i + 1).fold(0, (p, c) => p + c);

      double startWidth = size.width * sumBeforeIndex / total;
      double width = size.width * sumAfterIndex / total;

      if (currentHeight != 0) {
        pointDown(canvas, startWidth, size.height, currentHeight, width - startWidth);
        currentHeight = 0;
      } else {
        currentHeight = size.height - (size.height * ((Random().nextInt(30) + 70) / 100));
        pointUp(canvas, startWidth, size.height, currentHeight, width - startWidth);
      }
    }

    path.close();
    paintObject.style = PaintingStyle.fill;
    canvas.drawPath(path, paintObject);
  }

  void pointDown(Canvas canvas, double startWidth, double baseHeight, double height, double width) {
    paintObject.color = Colors.white;

    path.moveTo(startWidth, height);
    path.lineTo(startWidth, baseHeight);
    path.lineTo(width + startWidth, baseHeight);
  }

  void pointUp(Canvas canvas, double startWidth, double baseHeight, double height, double width) {
    paintObject.color = Colors.white;

    path.moveTo(startWidth + width, height);
    path.lineTo(startWidth, baseHeight);
    path.lineTo(width + startWidth, baseHeight);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
