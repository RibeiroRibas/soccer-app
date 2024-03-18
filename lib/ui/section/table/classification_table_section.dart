import 'package:flutter/material.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/shared/extensions/team_score_list_extension.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/ui/component/text_with_border_component.dart';
import 'widget/column_position_and_name_widget.dart';
import 'widget/column_team_scores_widget.dart';

class ClassificationTableSection extends StatelessWidget {
  final List<TeamScore> teamsScore;

  const ClassificationTableSection({
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
            textStyle: greenTheme.textTheme.displayMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColumnPositionAndNameWidget(
                teamNameTableValues: teamsScore.getTeamNames()),
            ColumnTeamScoresWidget(
              teamScoreTableValues: teamsScore.getTeamScores(),
            )
          ],
        ),
      ],
    );
  }
}
