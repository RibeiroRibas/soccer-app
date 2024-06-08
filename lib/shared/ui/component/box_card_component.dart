import 'package:flutter/material.dart';

class BoxCardComponent extends StatelessWidget {
  final Widget boxCardBody;
  final Color? color;

  const BoxCardComponent({
    super.key,
    required this.boxCardBody,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
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
