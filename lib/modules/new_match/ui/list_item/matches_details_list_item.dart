import 'package:flutter/material.dart';
import 'package:team_draw/model/match_details.dart';
import 'package:team_draw/shared/helper/date_time_format_helper.dart';
import 'package:team_draw/shared/ui/component/check_box_component.dart';
import 'package:team_draw/shared/ui/component/match_score_component.dart';

class MatchesDetailsListItem extends StatelessWidget {
  final MatchDetails match;
  final bool value;
  final Function(bool) onValueSelected;

  const MatchesDetailsListItem(
      {super.key,
      required this.match,
      required this.value,
      required this.onValueSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckBoxComponent(
          value: value,
          onValueSelected: onValueSelected,
          text: DateTimeFormatHelper.fromDateTimeToString(
              match.matches.first.matchDate!),
        ),
        for (var teamMatch in match.matches) ...{
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: MatchScoreComponent(match: teamMatch))
        }
      ],
    );
  }
}
