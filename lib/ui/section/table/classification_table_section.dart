import 'package:flutter/material.dart';

import '../../../shared/i18n/messages.dart';
import '../../../shared/theme/green_theme.dart';
import '../../component/text_with_border_component.dart';
import 'widget/column_position_and_name_widget.dart';
import 'widget/column_team_scores_widget.dart';

class ClassificationTableSection extends StatelessWidget {
  final List<String> teamNameTableValues;
  final List<List<String>> teamScoreTableValues;

  const ClassificationTableSection(
      {Key? key,
      required this.teamScoreTableValues,
      required this.teamNameTableValues})
      : super(key: key);

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
              ColumnPositionAndNameWidget(teamNameTableValues: teamNameTableValues),
              ColumnTeamScoresWidget(teamScoreTableValues: teamScoreTableValues)
            ],
          ),
        ],
      ),
    );
  }
}
