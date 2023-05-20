import 'package:flutter/material.dart';
import 'package:team_draw/shared/themes/theme_colors.dart';

import '../themes/green_theme.dart';

class CheckBoxComponent extends StatefulWidget {
  const CheckBoxComponent({Key? key}) : super(key: key);

  @override
  State<CheckBoxComponent> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<CheckBoxComponent> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: ThemeColors.black,
      fillColor: MaterialStateProperty.all(greenTheme.primaryColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}