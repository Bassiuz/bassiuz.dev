import 'data/ai_manifest_en.dart';
import 'data/ai_manifest_nl.dart';

enum ManifestLanguage {
  nl(label: 'Nederlands', content: aiManifestNlContent),
  en(label: 'English', content: aiManifestEnContent);

  const ManifestLanguage({required this.label, required this.content});

  final String label;
  final String content;

  static ManifestLanguage fromCode(String code) =>
      ManifestLanguage.values.where((language) => language.name == code).firstOrNull ?? ManifestLanguage.nl;
}
