import 'package:flutter/material.dart';

class UseCaseWrapper {
  static Widget wrap(Widget Function(BuildContext context) buildWidget) =>
      Material(child: Builder(builder: (context) => buildWidget(context)));
}
