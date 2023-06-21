import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/section/question_section.dart';
import 'slider_overall_widget.dart';

class PlayerOverallView extends StatelessWidget {

  const PlayerOverallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();
    return Column(
      children: [
        const QuestionSection(
          questionText: playerOverall,
          subQuestionText: fromOneToFive,
        ),
        const SizedBox(height: 20),
        SliderOverallWidget(
          initialValue: viewModel.player.overall,
          onChanged: (overall) {
            viewModel.player.overall = overall;
          },
        ),
      ],
    );
  }
}
