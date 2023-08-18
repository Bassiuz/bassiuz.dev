import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/context_extension.dart';
import 'circle_hover_inkwell.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.social});

  final Socials social;

  @override
  Widget build(BuildContext context) {
    return CircleHoverInkwell(
      onClick: () async => await canLaunchUrl(Uri.parse(social.url))
          ? await launchUrl(Uri.parse(social.url), mode: LaunchMode.externalApplication)
          : print('je moeder heet henk'),
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Padding(
          padding: EdgeInsets.all(context.fluid.spaces.xs),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              switch (social) {
                Socials.twitter => const Icon(Ionicons.logo_twitter, color: Colors.white),
                Socials.github => const Icon(Ionicons.logo_github, color: Colors.white),
                Socials.medium => const Icon(Ionicons.logo_medium, color: Colors.white),
                Socials.linkedin => const Icon(Ionicons.logo_linkedin, color: Colors.white),
              },
              Text(
                switch (social) {
                  Socials.twitter => 'Twitter',
                  Socials.github => 'Github',
                  Socials.medium => 'Medium',
                  Socials.linkedin => 'LinkedIn',
                },
                style: context.theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ],
          ),
        );
      }),
    );
  }
}

enum Socials {
  twitter,
  github,
  medium,
  linkedin;

  String get url => switch (this) {
        Socials.twitter => 'https://twitter.com/Bassiuz',
        Socials.github => 'https://github.com/bassiuz',
        Socials.medium => 'https://medium.com/@bassiuz',
        Socials.linkedin => 'https://www.linkedin.com/in/bas-de-vaan-31609046/',
      };
}
