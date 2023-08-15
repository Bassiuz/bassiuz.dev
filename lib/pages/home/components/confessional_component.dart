import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/max_width_wrapper.dart';

class ConfessionalComponent extends StatelessWidget {
  const ConfessionalComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.fluid.spaces.m),
      child: Align(
        alignment: Alignment.center,
        child: MaxWidthWrapper(
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      '👋 Collaborate With Me!',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: context.fluid.spaces.s,
                    ),
                    Text(
                      '''🤝 Let's create something amazing together! Whether you're a fellow developer, a tech enthusiast, or anyone with a passion for innovation, I'm excited to collaborate with you.

📝 If you have ideas for insightful blog posts, want to co-author, or have thoughts on mobile development and Flutter, let's put our minds together and share our expertise. And if open source projects ignite your curiosity, I'm eager to team up and bring new visions to life.

💬 Connect with me on Twitter for engaging conversations in 280 characters, or drop me a message via email ( ✉️ b@sdevaan.nl ). Let's explore, learn, and create together – because collaboration fuels our journey towards digital excellence.''',
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.fluid.spaces.s,
              ),
              Flexible(
                flex: 2,
                child: Assets.images.bassie2Min.image(
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
