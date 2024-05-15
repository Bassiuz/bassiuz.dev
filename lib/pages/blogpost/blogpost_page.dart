import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import '../../core/url_launcher_method.dart';
import '../../core/widgets/code_element_builder.dart';
import '../../core/widgets/edged_banner.dart';
import '../../core/widgets/max_width_wrapper.dart';
import '../generic_page.dart';
import 'blog.dart';

@RoutePage()
class BlogpostPage extends StatelessWidget {
  const BlogpostPage({super.key, @PathParam('blogSlug') required this.blogSlug});

  final String blogSlug;

  @override
  Widget build(BuildContext context) {
    Blog blog = Blog.getBlogForSlug(blogSlug);

    return GenericPage(children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: EdgedBanner(
          bannerImage: blog.bannerLocation,
          randomSeed: blogSlug,
          darken: false,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.l),
        child: MaxWidthWrapper(
          child: Markdown(
            shrinkWrap: true,
            selectable: true,
            onTapLink: (text, href, title) => launchUrl(Uri.parse(href!)),
            data: blog.markdownContent,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              h1: Theme.of(context).textTheme.headlineLarge,
              h2: Theme.of(context).textTheme.headlineMedium,
              h3: Theme.of(context).textTheme.headlineSmall,
            ),
            builders: {
              'code': CodeElementBuilder(),
            },
            extensionSet: md.ExtensionSet(
              md.ExtensionSet.gitHubFlavored.blockSyntaxes,
              <md.InlineSyntax>[md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
            ),
          ),
        ),
      ),
    ]);
  }
}
