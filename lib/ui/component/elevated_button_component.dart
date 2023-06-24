import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;
  final Color? backgroundColor;

  const ElevatedButtonComponent({
    Key? key,
    required this.onButtonPressed,
    required this.text,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? greenTheme.primaryColor)),
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
