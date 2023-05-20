import 'package:flutter/material.dart';

import '../themes/green_theme.dart';

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
    return Padding(
      padding:
          const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Text(
                tittle,
                style: greenTheme.textTheme.titleMedium!.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.5
                    ..color = greenTheme.primaryColor,
                ),
                softWrap: true,
              ),
              Text(
                tittle,
                style: greenTheme.textTheme.titleMedium,
                softWrap: true,
              )
            ],
          ),
          if (icon != null)
            Icon(icon, size: 32, color: greenTheme.primaryColor),
        ],
      ),
    );
  }
}
