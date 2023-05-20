import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;

  const DefaultButton({
    Key? key,
    required this.onButtonPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
        Size(
          MediaQuery.of(context).size.width,
          40,
        ),
      )),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
