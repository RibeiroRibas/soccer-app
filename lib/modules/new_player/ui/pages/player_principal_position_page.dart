import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/ui/components/player_characteristics_component.dart';

class PlayerPrincipalPositionPage extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  PlayerPrincipalPositionPage(
      {super.key, required this.player, required this.goToNextPageView});

  final List<Position> positions = Position.allPositions();

  @override
  Widget build(BuildContext context) {
    return PlayerCharacteristicsComponent(
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
