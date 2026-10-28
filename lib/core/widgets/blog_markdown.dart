import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import 'code_element_builder.dart';

class BlogMarkdown extends StatelessWidget {
  const BlogMarkdown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      shrinkWrap: true,
      selectable: true,
      onTapLink: (text, href, title) => launchUrl(Uri.parse(href!)),
      data: data,
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
    );
  }
}
