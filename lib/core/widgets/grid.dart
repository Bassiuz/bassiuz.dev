import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    required this.crossAxisCount,
    required this.children,
  });

  final int crossAxisCount;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (int row = 0; row < (children.length / crossAxisCount).ceil(); row++)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: children
                  .sublist(
                    row * crossAxisCount,
                    (row + 1) * crossAxisCount < children.length ? (row + 1) * crossAxisCount : children.length,
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
