import 'package:flutter/material.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String labelText;
  const OutlinedTextFieldComponent({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
    );
  }
}
