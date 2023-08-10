import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/edged_banner.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(height: MediaQuery.sizeOf(context).height * 0.7, child: const EdgedBanner()));
  }
}
