import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

extension KnobsExtension on BuildContext {
  /// Creates adjustable parameters for the WidgetbookUseCase
  KnobsBuilder get knobsOrMock {
    KnobsBuilder knobs;

    try {
      knobs = this.knobs;
    } catch (_) {
      knobs = MockKnobsBuilder();
    }

    return knobs;
  }
}

class MockKnobsBuilder implements KnobsBuilder {
  @override
  bool boolean({required String label, String? description, bool initialValue = false}) {
    return initialValue;
  }

  @override
  bool? booleanOrNull({required String label, String? description, bool? initialValue = false}) {
    return initialValue;
  }

  @override
  Color color({required String label, required Color initialValue, String? description}) {
    return initialValue;
  }

  @override
  DoubleKnobsBuilder get double => throw UnimplementedError();

  @override
  DoubleOrNullKnobsBuilder get doubleOrNull => throw UnimplementedError();

  @override
  T list<T>(
      {required String label,
      required List<T> options,
      T? initialOption,
      String? description,
      LabelBuilder<T>? labelBuilder}) {
    return initialOption!;
  }

  @override
  T? listOrNull<T>(
      {required String label,
      required List<T?> options,
      T? initialOption,
      String? description,
      LabelBuilder<T?>? labelBuilder}) {
    return initialOption;
  }

  @override
  KnobAdded get onKnobAdded => throw UnimplementedError();

  @override
  String string({required String label, String? description, String initialValue = '', int? maxLines = 1}) {
    return initialValue;
  }

  @override
  String? stringOrNull({required String label, String? description, String? initialValue, int? maxLines = 1}) {
    return initialValue;
  }
}
