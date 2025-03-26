import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';

class ActionButtonsComponent extends StatelessWidget {
  final VoidCallback onContinueTap;
  final VoidCallback onSaveTap;

  const ActionButtonsComponent(
      {super.key, required this.onContinueTap, required this.onSaveTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButtonComponent(
              onButtonPressed: onSaveTap,
              text: savePlayer,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButtonComponent(
              onButtonPressed: onContinueTap,
              text: next,
            ),
          ),
        ),
      ],
    );
  }
}
