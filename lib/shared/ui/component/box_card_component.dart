import 'package:flutter/material.dart';

class BoxCardComponent extends StatelessWidget {
  final Widget boxCardBody;

  const BoxCardComponent({super.key, required this.boxCardBody});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
        boxShadow: kElevationToShadow[2],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: boxCardBody,
      ),
    );
  }
}
