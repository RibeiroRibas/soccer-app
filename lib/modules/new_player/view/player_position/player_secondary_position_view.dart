import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_position_view.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class PlayerSecondaryPositionView extends StatelessWidget {
  final Player player;
  final void Function(int) onActionPress;

  const PlayerSecondaryPositionView(
      {Key? key, required this.player, required this.onActionPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Position> positions = Position.allPositions();

    return Column(
      children: [
        PlayerPositionView(
          questionText: secondaryPositionQuestion,
          subQuestionText: secondaryPositionSubQuestion,
          positions: List.generate(
            positions.length,
            (index) {
              return Observer(
                builder: (BuildContext context) {
                  return CheckboxListTile(
                    title: Text(
                      positions.elementAt(index).name,
                      style: const TextStyle(fontSize: 12),
                      softWrap: false,
                    ),
                    value: player.secondaryPosition != null
                        ? player.secondaryPosition! == positions[index]
                        : false,
                    onChanged: (_) {
                      player.secondaryPosition = Position.fromIndex(index);
                      onActionPress(3);
                    },
                  );
                },
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            player.secondaryPosition = null;
            onActionPress(3);
          },
          child: Text(
            markAsUndefined,
            style: greenTheme.textTheme.displayMedium!
                .copyWith(color: greenTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
