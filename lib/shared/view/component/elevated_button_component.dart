import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;
  final Color? backgroundColor;

  const ElevatedButtonComponent({
    super.key,
    required this.onButtonPressed,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? Theme.of(context).primaryColor)),
      onPressed: onButtonPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
