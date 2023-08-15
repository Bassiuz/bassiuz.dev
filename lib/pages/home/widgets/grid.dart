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
          for (int i = 0; i < children.length; i += crossAxisCount)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: children.sublist(i, i + crossAxisCount).toList(),
            ),
        ],
      ),
    );
  }
}
