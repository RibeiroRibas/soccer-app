import 'package:flutter/material.dart';

class DropDownButtonComponent extends StatelessWidget {
  final dynamic value;
  final Function(String) onValueChange;
  final double width;
  final List<String> values;
  final String labelText;
  final double? height;

  const DropDownButtonComponent({
    super.key,
    this.value,
    required this.onValueChange,
    required this.width,
    required this.values,
    required this.labelText,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField<String>(
        dropdownColor: Theme.of(context).colorScheme.surface,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
        value: value,
        items: values
            .map((value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) {
          onValueChange(value!);
        },
      ),
    );
  }
}
