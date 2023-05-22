import 'package:flutter/material.dart';

import '../themes/green_theme.dart';

class BoxCardComponent extends StatelessWidget {
  final Widget boxCardBody;

  const BoxCardComponent({
    Key? key,
    required this.boxCardBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
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
