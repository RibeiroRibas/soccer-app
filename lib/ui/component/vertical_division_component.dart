import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class VerticalDivisionComponent extends StatelessWidget {
  final double height;
  const VerticalDivisionComponent({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1,
      decoration:
      BoxDecoration(border: Border.all(color: ThemeColors.division)),
    );
  }
}