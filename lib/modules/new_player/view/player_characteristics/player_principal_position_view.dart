import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/view/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/view/player_characteristics/player_characteristics_view.dart';

class PlayerPrincipalPositionView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerPrincipalPositionView(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  Widget build(BuildContext context) {
    final List<Position> positions = Position.allPositions();

    return PlayerCharacteristicsView(
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
              goToNextPageView(NewPlayerPageView.strengths);
            },
          );
        },
      ),
    );
  }
}
