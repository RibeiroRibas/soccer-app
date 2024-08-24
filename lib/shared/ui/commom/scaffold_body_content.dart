import 'package:flutter/material.dart';

class ScaffoldBodyContent extends StatelessWidget {
  final Widget child;

  const ScaffoldBodyContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
        child: child);
  }
}
