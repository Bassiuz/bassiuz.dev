import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

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

  double percentageVisible = 100;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 0)).then((_) => afterBuild());

    widget.parentScrollController.addListener(() {
      setState(() {
        percentageVisible = max(0, (widget.height - widget.parentScrollController.offset) / widget.height * 100);
      });
    });
  }

  void afterBuild() {
    if (containerHeight == 0) {
      setState(() {
        containerHeight = 1;
      });
    }
  }

  void onFinishFirst() {
    if (containerHeight2 == 0) {
      setState(() {
        containerHeight2 = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: widget.height,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 5000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: (containerHeight2 * widget.height) * (percentageVisible / 100),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/bassie.jpeg', width: 100, height: 100),
                          const SizedBox(height: 130),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 5000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    onEnd: onFinishFirst,
                    height: (containerHeight * widget.height) * (percentageVisible / 100) * (percentageVisible / 100),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/phone.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: context.theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
