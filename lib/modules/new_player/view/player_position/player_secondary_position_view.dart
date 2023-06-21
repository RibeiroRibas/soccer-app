import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_position_view.dart';

class PlayerSecondaryPositionView extends StatelessWidget {

  const PlayerSecondaryPositionView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();

    return PlayerPositionView(
      questionText: secondaryPositionQuestion,
      subQuestionText: secondaryPositionSubQuestion,
      positions: List.generate(
        viewModel.secondaryPositions.length,
        (index) {
          return Observer(
            builder: (BuildContext context) {
              return CheckboxListTile(
                title: Text(
                  viewModel.secondaryPositions.keys.elementAt(index),
                  style: const TextStyle(fontSize: 12),
                  softWrap: false,
                ),
                value: viewModel.secondaryPositions.values.elementAt(index),
                onChanged: (_) {
                  if (!viewModel.secondaryPositions.values.elementAt(index)) {
                    viewModel.player.secondaryPosition = Position.fromIndex(index);
                  }
                  viewModel.changeSecondaryPosition(
                      viewModel.secondaryPositions.keys.elementAt(index));
                },
              );
            },
          );
        },
      ),
    );
  }
}
