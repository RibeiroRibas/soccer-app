import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class ConfirmDeletePlayerDialog extends StatelessWidget {
  final String message;
  final VoidCallback onDeleteButtonTap;
  final VoidCallback onCancelButtonTap;

  const ConfirmDeletePlayerDialog(
      {super.key,
      required this.message,
      required this.onDeleteButtonTap,
      required this.onCancelButtonTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Center(child: Text(message)),
      actions: <Widget>[
        TextButton(
            onPressed: onDeleteButtonTap,
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(confirm)),
        TextButton(
            onPressed: onCancelButtonTap,
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(cancel)),
      ],
    );
  }
}
