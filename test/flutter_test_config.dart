import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

typedef FontLoader = void Function(FontWeight);

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  TestWidgetsFlutterBinding.ensureInitialized();

  /// these fonts need to be initialized once before rendering the widgets, else initing them will be too late.

  List<FontWeight> fontWeights = [
    FontWeight.w400,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w700,
    FontWeight.w800,
  ];

  List<FontLoader> loadFunctions = [
    (FontWeight fontWeight) => GoogleFonts.firaMono(fontWeight: fontWeight),
    (FontWeight fontWeight) => GoogleFonts.firaSans(fontWeight: fontWeight),
    (FontWeight fontWeight) => GoogleFonts.rubik(fontWeight: fontWeight),
  ];

  for (var loadFunction in loadFunctions) {
    for (var fontWeight in fontWeights) {
      loadFunction(fontWeight);
    }
  }

  await loadFonts();

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        platforms: <HostPlatform>{
          HostPlatform.macOS,
          HostPlatform.windows,
        },
      ),
    ),
    run: testMain,
  );
}
