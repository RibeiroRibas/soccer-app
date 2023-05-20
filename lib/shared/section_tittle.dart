import 'package:flutter/material.dart';
import 'package:team_draw/themes/green_theme.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    Key? key,
    required this.icon,
    required this.tittle,
  }) : super(key: key);

  final IconData icon;
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = greenTheme.primaryColor,
                ),
                softWrap: true,
              ),
              Text(
                tittle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                softWrap: true,
              )
            ],
          ),
          Icon(
            icon,
            size: 32,
            color: greenTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
