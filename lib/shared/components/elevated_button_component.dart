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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        child: Text(text),
      ),
    );
  }
}
