import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/blog_markdown.dart';
import '../../core/widgets/edged_banner.dart';
import '../../core/widgets/max_width_wrapper.dart';
import '../generic_page.dart';
import 'blog.dart';

@RoutePage()
class BlogpostPage extends StatelessWidget {
  const BlogpostPage({super.key, @PathParam('blogSlug') required this.blogSlug});

  final String blogSlug;

  @override
  Widget build(BuildContext context) {
    Blog blog = Blog.getBlogForSlug(blogSlug);

    return GenericPage(children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: EdgedBanner(
          bannerImage: blog.bannerLocation,
          randomSeed: blogSlug,
          darken: false,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.fluid.spaces.l),
        child: MaxWidthWrapper(child: BlogMarkdown(data: blog.markdownContent)),
      ),
    ]);
  }
}
