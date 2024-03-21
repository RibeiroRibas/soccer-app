import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class HorizontalDivisionComponent extends StatelessWidget {
  final double width;

  const HorizontalDivisionComponent({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      decoration:
          BoxDecoration(border: Border.all(color: ThemeColors.division)),
    );
  }
}
