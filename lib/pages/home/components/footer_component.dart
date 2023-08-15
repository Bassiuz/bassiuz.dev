import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/social_icon.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Assets.images.nature.image(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              )),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(context.fluid.spaces.s),
                  child: Text(
                    "Thank you for getting all the way to the bottom of the page ❤️",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(social: Socials.twitter),
                    SocialIcon(social: Socials.medium),
                    SocialIcon(social: Socials.linkedin),
                    SocialIcon(social: Socials.github),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
