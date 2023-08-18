import 'dart:async';

import 'package:flutter/material.dart';

class ScrollManager {
  ScrollController scrollController = ScrollController();
  final visibleItems = StreamController<List<int>>.broadcast();
}
