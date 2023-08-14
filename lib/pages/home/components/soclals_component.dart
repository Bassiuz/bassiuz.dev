import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/breakpoint_extension.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/max_width_wrapper.dart';
import '../widgets/social_icon.dart';
import '../widgets/visible_widget.dart';

class SocialsComponent extends StatelessWidget {
  const SocialsComponent({super.key, required this.indexInScroll});

  final int indexInScroll;

  @override
  Widget build(BuildContext context) {
    return VisibleWidgetBuilder(
      indexInScroll: indexInScroll,
      builder: (BuildContext context, bool visible) => SizedBox(
        height: context.verySmall ? 300 : 220,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Assets.images.backgroundBassie.image(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Center(
              child: MaxWidthWrapper(
                child: Padding(
                  padding: EdgeInsets.all(context.fluid.spaces.m),
                  child: Column(
                    children: [
                      Text(
                        'Find me on',
                        style: context.theme.textTheme.headlineLarge!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SocialIcon(social: Socials.twitter),
                                Flexible(
                                    child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: visible ? context.fluid.viewportConfig.maxViewportSize : 0)),
                                const SocialIcon(social: Socials.medium),
                                if (!context.verySmall) ...{
                                  Flexible(
                                      child: AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          width: visible ? context.fluid.viewportConfig.maxViewportSize : 0)),
                                  const SocialIcon(social: Socials.linkedin),
                                  Flexible(
                                      child: AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          width: visible ? context.fluid.viewportConfig.maxViewportSize : 0)),
                                  const SocialIcon(social: Socials.github),
                                }
                              ],
                            ),
                            if (context.verySmall) ...{
                              SizedBox(height: context.fluid.spaces.m),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SocialIcon(social: Socials.linkedin),
                                  Flexible(
                                      child: AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          width: visible ? context.fluid.viewportConfig.maxViewportSize : 0)),
                                  const SocialIcon(social: Socials.github),
                                ],
                              ),
                            },
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
