import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_position_view.dart';

class PlayerPrincipalPositionView extends StatelessWidget {
  final Player player;
  final void Function(int) onActionPress;

  const PlayerPrincipalPositionView(
      {super.key, required this.player, required this.onActionPress});

  @override
  Widget build(BuildContext context) {
    final List<Position> positions = Position.allPositions();

    return PlayerPositionView(
      questionText: principalPositionQuestion,
      subQuestionText: principalPositionSubQuestion,
      positions: List.generate(
        positions.length,
        (index) {
          return CheckboxListTile(
            title: Text(
              positions.elementAt(index).name,
              style: const TextStyle(fontSize: 12),
              softWrap: false,
            ),
            value: player.principalPosition != null
                ? player.principalPosition! == positions[index]
                : false,
            onChanged: (_) {
              player.principalPosition = Position.fromIndex(index);
              onActionPress(2);
            },
          );
        },
      ),
    );
  }
}
