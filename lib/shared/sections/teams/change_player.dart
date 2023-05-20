import 'package:flutter/material.dart';
import 'package:team_draw/themes/green_theme.dart';
import 'package:team_draw/themes/theme_colors.dart';

class ChangePlayer extends StatelessWidget {
  const ChangePlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("X"),
        ),
        const VerticalDivision(),
        Icon(
          Icons.arrow_forward,
          size: 32,
          color: greenTheme.primaryColor,
        ),
        const VerticalDivision(),
        Icon(
          Icons.arrow_back,
          size: 32,
          color: greenTheme.primaryColor,
        ),
        const VerticalDivision(),
      ],
    );
  }
}

class VerticalDivision extends StatelessWidget {
  const VerticalDivision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 1,
      decoration:
          BoxDecoration(border: Border.all(color: ThemeColors.division)),
    );
  }
}
