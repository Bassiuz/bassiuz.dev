import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/sizes.dart';
import '../../core/widgets/edged_banner.dart';
import '../../gen/assets.gen.dart';
import '../generic_page.dart';

@RoutePage()
class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

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
          child: Container()),
    ]);
  }
}
