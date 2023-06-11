import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/view/new_player/player_position/player_position_view.dart';

class PlayerPrincipalPositionView extends StatelessWidget {
  const PlayerPrincipalPositionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlayerPositionView(
        questionText: principalPositionQuestion,
        subQuestionText: principalPositionSubQuestion);
  }
}
