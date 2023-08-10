import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'components/banner_component.dart';

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
    return Scaffold(
        body: ListView(
      children: const [
        BannerComponent(),
      ],
    ));
  }
}
