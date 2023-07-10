import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'widgets/home_page_banner.dart';

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
      controller: _controller,
      children: [
        HomePageBanner(
          parentScrollController: _controller,
          height: FluidSize(fluidConfig: context.fluid, min: 300, max: 500).value,
        ),
        Container(
          height: 1200,
          color: Colors.red,
        ),
      ],
    ));
  }
}
