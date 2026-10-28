import 'package:alchemist/alchemist.dart';
import 'package:bassiuz_dev/pages/ai/language_switcher.dart';
import 'package:bassiuz_dev/pages/ai/manifest_language.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/use_case_wrapper.dart';

void main() {
  group('Language Switcher Golden Test', () {
    goldenTest(
      'renders correctly',
      fileName: 'language_switcher_golden_test',
      builder: () => GoldenTestGroup(
        children: [
          for (final language in ManifestLanguage.values)
            GoldenTestScenario(
              name: '${language.name} selected',
              child: UseCaseWrapper.wrap((_) => LanguageSwitcher(selected: language, onChanged: (_) {})),
            ),
        ],
      ),
    );
  });
}
