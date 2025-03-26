import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class EndMatchAlertDialog extends StatelessWidget {
  final VoidCallback onContinueTap;
  final VoidCallback onEndMatchTap;

  const EndMatchAlertDialog(
      {super.key, required this.onContinueTap, required this.onEndMatchTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Center(child: Text(endMatch)),
      actions: <Widget>[
        TextButton(
            onPressed: onContinueTap,
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(continuePlaying)),
        TextButton(
            onPressed: onEndMatchTap,
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(stopMatch)),
      ],
    );
  }
}
