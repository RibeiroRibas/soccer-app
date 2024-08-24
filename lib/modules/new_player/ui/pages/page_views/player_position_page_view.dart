import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/components/player_characteristics_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerPositionPageView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  PlayerPositionPageView(
      {super.key, required this.player, required this.goToNextPageView});

  final List<Position> positions = Position.values;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    focusNode.requestFocus();
    return PlayerCharacteristicsComponent(
      heightSize: 400,
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
            focusNode: focusNode,
            value: player.principalPosition != null
                ? player.principalPosition! == positions[index]
                : false,
            onChanged: (_) {
              player.principalPosition = Position.fromIndex(index);
              goToNextPageView(NewPlayerPageView.overall);
            },
          );
        },
      ),
    );
  }
}
