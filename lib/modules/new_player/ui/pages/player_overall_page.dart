import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/components/slider_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/question_component.dart';

class PlayerOverallPage extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerOverallPage(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionComponent(
          questionText: playerOverall,
          subQuestionText: swipeToSelect,
        ),
        const SizedBox(height: 20),
        SliderOverallComponent(
          initialValue: player.overall,
          onChangeEnd: (overall) {
            player.overall = overall;
            goToNextPageView(NewPlayerPageView.confirmNewPlayer);
          },
        ),
      ],
    );
  }
}
