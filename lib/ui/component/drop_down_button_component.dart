import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class DropDownButtonComponent extends StatelessWidget {
  final int? value;
  final Function(int) onValueChange;
  final double width;
  final List<int> values;
  final String labelText;

  const DropDownButtonComponent({
    super.key,
    this.value,
    required this.onValueChange,
    required this.width,
    required this.values,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: DropdownButtonFormField<int>(
        dropdownColor: ThemeColors.backgroundColor,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white,
              width: 2.0,
            ),
          ),
        ),
        value: value ?? 0,
        items: values
            .map((hr) =>
                DropdownMenuItem<int>(value: hr, child: Text(hr.toString())))
            .toList(),
        onChanged: (value) {
          onValueChange(value!);
        },
      ),
    );
  }
}
