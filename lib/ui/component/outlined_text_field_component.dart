import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;

  const OutlinedTextFieldComponent({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
    this.autoFocus = true,
    this.inputFormatters,
    this.maxLength,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxLength,
      autofocus: autoFocus,
      validator: validator,
      initialValue: initialValue,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
    );
  }
}
