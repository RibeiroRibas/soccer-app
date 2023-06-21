import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_position_view.dart';

class PlayerPrincipalPositionView extends StatelessWidget {

  const PlayerPrincipalPositionView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();

    return PlayerPositionView(
      questionText: principalPositionQuestion,
      subQuestionText: principalPositionSubQuestion,
      positions: List.generate(
        viewModel.principalPositions.length,
        (index) {
          return Observer(
            builder: (BuildContext context) {
              return CheckboxListTile(
                title: Text(
                  viewModel.principalPositions.keys.elementAt(index),
                  style: const TextStyle(fontSize: 12),
                  softWrap: false,
                ),
                value: viewModel.principalPositions.values.elementAt(index),
                onChanged: (_) {
                  if (!viewModel.principalPositions.values.elementAt(index)) {
                    viewModel.player.principalPosition = Position.fromIndex(index);
                  }
                  viewModel.changePrincipalPosition(
                      viewModel.principalPositions.keys.elementAt(index));
                },
              );
            },
          );
        },
      ),
    );
  }
}
