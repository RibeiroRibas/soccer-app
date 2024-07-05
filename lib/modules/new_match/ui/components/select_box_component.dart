import 'package:flutter/material.dart';
import 'package:team_draw/shared/ui/component/drop_down_button_component.dart';

class SelectBoxComponent extends StatelessWidget {
  final String description;
  final int? value;
  final Function(int) onValueChange;
  final List<int> values;
  final String labelText;

  const SelectBoxComponent(
      {super.key,
      this.value,
      required this.onValueChange,
      required this.values,
      required this.description,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(description)),
        const SizedBox(width: 10),
        DropDownButtonComponent(
          value: value == null || values.any((v) => v == value)
              ? value
              : values.last,
          onValueChange: onValueChange,
          width: MediaQuery.of(context).size.width / 4,
          values: values,
          labelText: labelText,
        ),
      ],
    );
  }
}
