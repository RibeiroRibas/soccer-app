import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;

  const ElevatedButtonComponent({
    Key? key,
    required this.onButtonPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onButtonPressed,
      child: Text(text, textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
