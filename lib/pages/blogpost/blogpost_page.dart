import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../generic_page.dart';

@RoutePage()
class BlogpostPage extends StatelessWidget {
  const BlogpostPage({super.key, @PathParam('blogSlug') required this.blogSlug});

  final String blogSlug;

  @override
  Widget build(BuildContext context) {
    return GenericPage(children: [
      SizedBox(height: context.fluid.spaces.xxl),
      Text(blogSlug),
    ]);
  }
}
