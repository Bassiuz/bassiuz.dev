import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/routing/app_router.dart';
import 'config/theme/bassiuz_dev_theme.dart';
import 'gen/assets.gen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  void precacheImages(BuildContext context) {
    for (var e in Assets.images.values) {
      precacheImage(e.provider(), context);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      builder: (context, child) => child!,
      theme: bassiuzDevTheme(context),
      routerConfig: _appRouter.config(),
    );
  }
}
