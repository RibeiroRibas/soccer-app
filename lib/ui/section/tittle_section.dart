import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/ui/component/text_with_border_component.dart';

class TittleSection extends StatelessWidget {
  final IconData? icon;
  final String tittle;

  const TittleSection({
    super.key,
    this.icon,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWithBorderComponent(
          text: tittle,
          textStyle: greenTheme.textTheme.displayMedium,
        ),
        if (icon != null) Icon(icon, size: 32, color: greenTheme.primaryColor),
      ],
    );
  }
}
