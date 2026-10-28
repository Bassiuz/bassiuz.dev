import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../config/routing/app_router.gr.dart';
import '../../core/widgets/blog_markdown.dart';
import '../../core/widgets/edged_banner.dart';
import '../../core/widgets/max_width_wrapper.dart';
import '../../gen/assets.gen.dart';
import '../generic_page.dart';
import 'language_switcher.dart';
import 'manifest_language.dart';

@RoutePage()
class AiPage extends StatelessWidget {
  const AiPage({super.key, @PathParam('lang') required this.lang});

  final String lang;

  @override
  Widget build(BuildContext context) {
    final language = ManifestLanguage.fromCode(lang);

    return GenericPage(children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: EdgedBanner(
          bannerImage: Assets.blogpost.ai.basMobile,
          randomSeed: 'ai',
          darken: false,
          // keeps the face in view when the portrait photo is cropped to a wide banner
          alignment: const Alignment(0, -0.45),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.l),
        child: MaxWidthWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: context.fluid.spaces.m),
              Padding(
                // lines up with the markdown's default 16px padding
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LanguageSwitcher(
                  selected: language,
                  onChanged: (newLanguage) => context.router.replace(AiRoute(lang: newLanguage.name)),
                ),
              ),
              BlogMarkdown(data: language.content),
            ],
          ),
        ),
      ),
    ]);
  }
}
