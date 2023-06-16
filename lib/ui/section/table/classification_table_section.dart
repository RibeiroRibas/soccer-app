import 'package:flutter/material.dart';
import 'package:team_draw/modules/app_navigator/model/team_score.dart';
import 'package:team_draw/shared/extensions/team_score_list_extension.dart';

import '../../../shared/i18n/messages.dart';
import '../../../shared/theme/green_theme.dart';
import '../../component/text_with_border_component.dart';
import 'widget/column_position_and_name_widget.dart';
import 'widget/column_team_scores_widget.dart';

class ClassificationTableSection extends StatelessWidget {
  final List<TeamScore> teamsScore;

  const ClassificationTableSection({
    Key? key,
    required this.teamsScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
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
      ),
    );
  }
}
