import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/sizes.dart';
import '../../core/widgets/blog_card.dart';
import '../../core/widgets/edged_banner.dart';
import '../../core/widgets/grid.dart';
import '../../core/widgets/max_width_wrapper.dart';
import '../../gen/assets.gen.dart';
import '../blogpost/blog.dart';
import '../generic_page.dart';

@RoutePage()
class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  int maxAmountOfRows = 5;

  @override
  Widget build(BuildContext context) {
    return GenericPage(children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: Stack(
          children: [
            const EdgedBanner(bannerImage: AssetGenImage('assets/images/background_bassie-min-min.jpg'), darken: true),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.teethSize),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Blogs & other content',
                          style: context.theme.textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      ConstrainedBox(
        constraints:
            //compensate here for header, footer and spacing between footer and content
            BoxConstraints(minHeight: (MediaQuery.sizeOf(context).height * 0.8) - 200 - context.fluid.spaces.xxl),
        child: MaxWidthWrapper(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Grid(
                  crossAxisCount: 3,
                  children: [
                    ...Blog.values.map((e) => BlogCard(blog: e)).toList(),
                    ...List.generate(3 - Blog.values.length % 3, (index) => const Flexible(child: SizedBox.shrink()))
                  ],
                ),
                Blog.values.length > (maxAmountOfRows * 3)
                    ? InkWell(
                        borderRadius: BorderRadius.circular(1337),
                        onTap: () => setState(() => maxAmountOfRows += 5),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Read More ...', style: TextStyle(color: Colors.blue)),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
