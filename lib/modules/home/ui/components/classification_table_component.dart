import 'package:flutter/material.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/modules/home/ui/components/column_position_and_name_component.dart';
import 'package:team_draw/modules/home/ui/components/column_team_scores_component.dart';
import 'package:team_draw/shared/extensions/team_score_list_extension.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class ClassificationTableComponent extends StatelessWidget {
  final List<TeamScore> teamsScore;

  const ClassificationTableComponent({
    super.key,
    required this.teamsScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: TextWithBorderComponent(
            text: classificationTable,
            textStyle: Theme.of(context).textTheme.bodyLarge!,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColumnPositionAndNameComponent(
                teamNameTableValues: teamsScore.getTeamNames()),
            ColumnTeamScoresComponent(
              teamScoreTableValues: teamsScore.getTeamScores(),
            )
          ],
        ),
      ],
    );
  }
}
