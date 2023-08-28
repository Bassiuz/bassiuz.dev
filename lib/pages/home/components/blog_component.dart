import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../config/routing/app_router.gr.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/blog_card.dart';
import '../../../core/widgets/max_width_wrapper.dart';
import '../../../core/widgets/visible_widget.dart';
import '../../blogpost/blog.dart';

class BlogComponent extends StatelessWidget {
  const BlogComponent({super.key, required this.indexInScroll});

  final int indexInScroll;

  @override
  Widget build(BuildContext context) {
    return MaxWidthWrapper(
      child: VisibleWidgetBuilder(
        indexInScroll: indexInScroll,
        builder: (context, visible) => MaxWidthWrapper(
          child: Padding(
            padding: EdgeInsets.all(context.fluid.spaces.m),
            child: Column(
              children: [
                Text(
                  'Recent Articles',
                  style: context.theme.textTheme.headlineMedium,
                ),
                Row(
                  children: [
                    BlogCard(blog: Blog.values.first),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    BlogCard(blog: Blog.values.first),
                    AnimatedContainer(
                      width: visible ? context.fluid.space.from.zero.to.m : 100,
                      duration: const Duration(milliseconds: 200),
                    ),
                    BlogCard(blog: Blog.values.first),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(1337),
                  onTap: context.navigateToRouteIfNotOnRoute(const BlogsRoute()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Read More ...', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
