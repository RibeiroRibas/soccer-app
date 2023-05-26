import 'package:flutter/material.dart';
import 'package:team_draw/ui/component/text_with_border_component.dart';

import '../../shared/theme/green_theme.dart';

class TittleSection extends StatelessWidget {
  const TittleSection({
    Key? key,
    this.icon,
    required this.tittle,
  }) : super(key: key);

  final IconData? icon;
  final String tittle;

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
