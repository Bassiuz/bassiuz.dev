import 'package:flutter/material.dart';

class CircleHoverInkwell extends StatefulWidget {
  const CircleHoverInkwell({super.key, required this.onClick, required this.child});

  final VoidCallback onClick;
  final Widget child;

  @override
  State<CircleHoverInkwell> createState() => _CircleHoverInkwellState();
}

class _CircleHoverInkwellState extends State<CircleHoverInkwell> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      onHover: (val) => setState(() => hover = val),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(color: hover ? Colors.white24 : null, borderRadius: BorderRadius.circular(1337)),
        child: widget.child,
      ),
    );
  }
}
