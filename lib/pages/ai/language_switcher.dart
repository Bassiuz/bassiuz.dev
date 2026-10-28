import 'package:flutter/material.dart';

import 'manifest_language.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key, required this.selected, required this.onChanged});

  final ManifestLanguage selected;
  final ValueChanged<ManifestLanguage> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ManifestLanguage>(
      showSelectedIcon: false,
      segments: [
        for (final language in ManifestLanguage.values)
          ButtonSegment(value: language, label: Text(language.label)),
      ],
      selected: {selected},
      onSelectionChanged: (selection) => onChanged(selection.single),
    );
  }
}
