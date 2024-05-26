import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class MovePlayerAlertDialog extends StatelessWidget {
  final Player player;
  final String tittle;
  final Function(Player) onMovePlayer;

  const MovePlayerAlertDialog(
      {super.key,
      required this.player,
      required this.tittle,
      required this.onMovePlayer});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(tittle),
      actions: <Widget>[
        TextButton(
            onPressed: () => {
                  onMovePlayer(player),
                  Navigator.of(context).pop(),
                },
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(ok)),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondary)),
            child: const Text(cancel)),
      ],
    );
  }
}
