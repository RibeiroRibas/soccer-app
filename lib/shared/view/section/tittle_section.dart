import 'package:flutter/material.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

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
          textStyle: Theme.of(context).textTheme.bodyLarge!,
        ),
        if (icon != null)
          Icon(icon, size: 32, color: Theme.of(context).primaryColor),
      ],
    );
  }
}
