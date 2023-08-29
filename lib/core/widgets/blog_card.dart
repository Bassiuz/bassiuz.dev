import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../config/routing/app_router.gr.dart';
import '../../pages/blogpost/blog.dart';
import '../extensions/context_extension.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        borderRadius: BorderRadius.circular(context.fluid.spaces.s),
        onTap: () => context.router.push(BlogpostRoute(blogSlug: blog.slug)),
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.s),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: SizedBox(
                    child: blog.bannerLocation.image(
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(blog.title, style: context.theme.textTheme.headlineSmall),
                    Text(blog.publicationDate,
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ),
              Text(
                blog.summary,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
