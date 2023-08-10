import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/sizes.dart';
import '../widgets/animated_text.dart';
import '../widgets/edged_banner.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Stack(
        children: [
          const EdgedBanner(),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.teethSize),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, I\'m',
                        style: context.theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Bas de Vaan',
                        style: context.theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const AnimatedText(),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
