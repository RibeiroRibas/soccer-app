import 'package:flutter/material.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String labelText;
  final String playerName;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const OutlinedTextFieldComponent({
    Key? key,
    required this.labelText,
    required this.playerName,
    required this.onChanged,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      validator: validator,
      initialValue: playerName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
