import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/animated_text.dart';
import 'animated_phone_widget.dart';

class HomePageBanner extends StatefulWidget {
  const HomePageBanner({
    super.key,
    required this.parentScrollController,
    required this.height,
  });

  final ScrollController parentScrollController;
  final double height;

  @override
  State<HomePageBanner> createState() => _HomePageBannerState();
}

class _HomePageBannerState extends State<HomePageBanner> {
  double containerHeight = 0;
  double containerHeight2 = 0;

  double percentageVisible = 0;
  final double _direcitionalityBreakPoint = 800;
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 0)).then((_) => afterBuild());

    widget.parentScrollController.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {
        percentageVisible = max(0, (widget.height - widget.parentScrollController.offset) / widget.height * 100);
      });
    });
  }

  void afterBuild() {
    if (!mounted) {
      return;
    }
    setState(() {
      percentageVisible = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      AnimatedPhoneWidget(
        height: widget.height,
        percentageVisible: percentageVisible,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Bassiuz.dev',
            style: context.theme.textTheme.headlineMedium,
          ),
          const AnimatedText(),
        ],
      ),
    ];

    return MediaQuery.sizeOf(context).width > _direcitionalityBreakPoint
        ? IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: children.first,
                ),
                Expanded(
                  flex: 3,
                  child: children.last,
                ),
              ],
            ),
          )
        : Column(
            children: children,
          );
  }
}
