import 'package:flutter/material.dart';

import '../themes/green_theme.dart';

class BoxCardComponent extends StatelessWidget {
  final Widget boxCardBody;
  final double height;
  final double width;

  const BoxCardComponent({
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
