import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../generic_page.dart';
import 'components/banner_component.dart';
import 'components/blog_component.dart';
import 'components/confessional_component.dart';
import 'components/introduction_component.dart';
import 'components/phone_screenshot_flow_component.dart';
import 'components/skill_grid_component.dart';
import 'components/soclals_component.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericPage(children: [
      const BannerComponent(),
      SizedBox(height: context.fluid.spaces.m),
      const IntroductionComponent(),
      SizedBox(height: context.fluid.spaces.xxl),
      const BlogComponent(indexInScroll: 4),
      SizedBox(height: context.fluid.spaces.l),
      const SocialsComponent(indexInScroll: 6),
      SizedBox(height: context.fluid.spaces.xxl),
      const SkillGridComponent(indexInScroll: 8),
      SizedBox(height: context.fluid.spaces.xxl),
      const PhoneScreenshotFlowComponent(),
      SizedBox(height: context.fluid.spaces.xxl),
      const ConfessionalComponent(),
      SizedBox(height: context.fluid.spaces.xxl),
    ]);
  }
}
