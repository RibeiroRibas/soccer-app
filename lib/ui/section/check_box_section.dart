import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

import '../../shared/theme/green_theme.dart';

class CheckBoxSection extends StatefulWidget {
  final String text;
  final bool isChecked;
  final Function(String) onItemSelected;

  const CheckBoxSection({
    Key? key,
    required this.text,
    this.isChecked = true,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<CheckBoxSection> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<CheckBoxSection> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
    if (isChecked) {
      widget.onItemSelected(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: ThemeColors.black,
          fillColor: MaterialStateProperty.all(greenTheme.primaryColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.onItemSelected(widget.text);
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: greenTheme.textTheme.displaySmall,
        ),
      ],
    );
  }
}
