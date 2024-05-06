import 'package:alchemist/alchemist.dart';
import 'package:bassiuz_dev/core/widgets/skill_card.dart';
import 'package:bassiuz_dev/pages/home/components/skill_grid_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../utils/mock_knobs_builder.dart';
import '../utils/use_case_wrapper.dart';

//ignore: avoid-returning-widgets
@UseCase(name: 'basic', type: SkillCard)
Widget skillCard(BuildContext context) {
  return Row(
    children: [
      SkillCard(
        skill:
            context.knobsOrMock.list(label: "prefilled skills", options: Skill.values, initialOption: Skill.experience),
      ),
    ],
  );

  /*eturn CheckboxInput(
    field: CheckBoxFieldType(
      name: 'checkbox',
      value: context.knobsOrMock.boolean(label: 'checkboxValue', initialValue: initialValue),
      type: FieldType.bulletin,
      label: context.knobsOrMock.string(
        label: 'CheckboxLabel',
        initialValue: 'checkbox',
      ),
    ),
    onChanged: (bool? changed) {
      initialValue = changed ?? false;
    },
  );*/
}

void main() {
  group('Skill Card Golden Test', () {
    goldenTest(
      'renders correctly',
      fileName: 'skill_card_golden_test',
      builder: () => UseCaseWrapper.wrap((context) => SizedBox(height: 200, width: 300, child: skillCard(context))),
    );
  });
}
