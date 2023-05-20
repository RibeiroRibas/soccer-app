import 'package:flutter/material.dart';
import 'package:team_draw/themes/green_theme.dart';

class BoxCard extends StatelessWidget {
  final Widget boxCardBody;
  final double height;
  final double width;

  const BoxCard({
    Key? key,
    required this.boxCardBody,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: greenTheme.cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: kElevationToShadow[2],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: boxCardBody,
      ),
    );
  }
}