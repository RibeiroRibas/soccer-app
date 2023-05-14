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
          Text(
            tittle,
            style: const TextStyle(fontWeight: FontWeight.bold),
            softWrap: true,
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
