import 'package:flutter/material.dart';
import 'package:team_draw/ui/component/drop_down_button_component.dart';

class SelectBoxWidget extends StatelessWidget {
  final String description;
  final int? value;
  final Function(int) onValueChange;
  final List<int> values;
  final String labelText;

  const SelectBoxWidget(
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
        DropDownButtonComponent(
          value: value,
          onValueChange: (value) => onValueChange(value),
          width: MediaQuery.of(context).size.width / 4,
          values: values,
          labelText: labelText,
        ),
      ],
    );
  }
}
