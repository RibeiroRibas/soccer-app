import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/section/question_section.dart';
import 'slider_overall_widget.dart';

class PlayerOverallView extends StatelessWidget {
  final Player player;
  final void Function(int) onActionPress;

  const PlayerOverallView(
      {super.key, required this.player, required this.onActionPress});

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
            onActionPress(4);
          },
        ),
      ],
    );
  }
}
