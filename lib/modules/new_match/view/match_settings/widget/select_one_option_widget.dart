import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class SelectOneOptionWidget extends StatelessWidget {
  final String question;
  final bool value;
  final Function(bool) onValueSelected;

  const SelectOneOptionWidget(
      {Key? key,
      required this.question,
      required this.value,
      required this.onValueSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: CheckboxListTile(
            title: const Text(
              yes,
              style: TextStyle(fontSize: 12),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: value,
            contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            onChanged: (_) => onValueSelected(true),
          ),
        ),
        Expanded(child: Center(child: Text(question))),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: CheckboxListTile(
            title: const Text(
              no,
              style: TextStyle(fontSize: 12),
            ),
            value: !value,
            contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            onChanged: (_) => onValueSelected(false),
          ),
        ),
      ],
    );
  }
}
