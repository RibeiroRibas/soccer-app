import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class VerticalDivisionComponent extends StatelessWidget {
  final double height;
  const VerticalDivisionComponent({super.key, required this.height});

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
