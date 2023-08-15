import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        borderRadius: BorderRadius.circular(context.fluid.spaces.s),
        onTap: () => {},
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.s),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: SizedBox(
                    child: Assets.images.backgroundBassieMinMin.image(
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text('Blog Title', style: context.theme.textTheme.headlineSmall),
                    Text('12 / 12 / 2023',
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ),
              Text(
                'Blog Description with a describing of what the blog is about and that will elipse into a couple of dots if it doesnt fit in a couple of rows of text to keep it a small card',
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
