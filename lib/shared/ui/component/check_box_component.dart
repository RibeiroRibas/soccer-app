import 'package:flutter/material.dart';

class CheckBoxComponent extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onValueSelected;

  const CheckBoxComponent(
      {super.key,
      required this.value,
      required this.onValueSelected,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: CheckboxListTile(
        title: Text(text, style: const TextStyle(fontSize: 14)),
        value: !value,
        contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
        onChanged: (_) => onValueSelected(false),
      ),
    );
  }
}
