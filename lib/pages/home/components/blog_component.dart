import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../widgets/blog_card.dart';
import '../widgets/max_width_wrapper.dart';
import '../widgets/visible_widget.dart';

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
                    const BlogCard(),
                    SizedBox(width: context.fluid.space.from.zero.to.m),
                    const BlogCard(),
                    SizedBox(width: context.fluid.space.from.zero.to.m),
                    const BlogCard(),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(1337),
                  onTap: () => {},
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
