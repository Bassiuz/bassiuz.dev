import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:markdown/markdown.dart' as md;

class CodeElementBuilder extends MarkdownElementBuilder {
  final double maxEditorWidth = 800;

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }

    CodeController codeController = CodeController(
      text: element.textContent,
      language: dart,
    );

    return CodeTheme(
      data: const CodeThemeData(styles: monokaiSublimeTheme),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxEditorWidth),
          child: CodeField(
            readOnly: true,
            wrap: true,
            controller: codeController,
            textStyle: GoogleFonts.firaMono(fontSize: preferredStyle!.fontSize),
          ),
        ),
      ),
    );
  }
}
