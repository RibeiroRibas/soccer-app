import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PreMatchDialog extends StatelessWidget {
  const PreMatchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Text(theMatchIsAlmostStart),
      content: const Text(preMatchMessage),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(okIGetIt)),
      ],
    );
  }
}
