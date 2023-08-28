import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/sizes.dart';
import '../../../core/widgets/animated_text.dart';
import '../../../core/widgets/edged_banner.dart';
import '../../../gen/assets.gen.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Stack(
        children: [
          const EdgedBanner(bannerImage: AssetGenImage('assets/images/background_bassie-min-min.jpg'), darken: true),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.teethSize),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: context.theme.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Bas de Vaan',
                        style: context.theme.textTheme.displayMedium,
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
