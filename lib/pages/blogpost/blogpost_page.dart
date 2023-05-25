import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BlogpostPage extends StatelessWidget {
  const BlogpostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('blog', style: Theme.of(context).textTheme.displayLarge));
  }
}
