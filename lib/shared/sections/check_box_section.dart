import 'package:flutter/material.dart';
import 'package:team_draw/shared/themes/theme_colors.dart';

import '../themes/green_theme.dart';

class CheckBoxSection extends StatefulWidget {
  final String text;

  const CheckBoxSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<CheckBoxSection> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<CheckBoxSection> {
  bool isChecked = true;

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
