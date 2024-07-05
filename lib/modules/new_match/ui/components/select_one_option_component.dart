import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/check_box_component.dart';

class SelectOneOptionComponent extends StatelessWidget {
  final String question;
  final bool value;
  final Function(bool) onValueSelected;

  const SelectOneOptionComponent(
      {super.key,
      required this.question,
      required this.value,
      required this.onValueSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckBoxComponent(
            value: value,
            onValueSelected: (value) => onValueSelected(value),
            text: yes),
        Expanded(child: Center(child: Text(question))),
        CheckBoxComponent(
            value: value,
            onValueSelected: (value) => onValueSelected(value),
            text: no),
      ],
    );
  }
}
