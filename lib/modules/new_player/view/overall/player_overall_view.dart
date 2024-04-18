import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/view/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/section/question_section.dart';

import 'slider_overall_widget.dart';

class PlayerOverallView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerOverallView(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionSection(
          questionText: playerOverall,
          subQuestionText: swipeToSelect,
        ),
        const SizedBox(height: 20),
        SliderOverallWidget(
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
