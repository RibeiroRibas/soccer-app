import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/ui/component/match_score_component.dart';
import 'package:team_draw/shared/ui/component/teams_info_component.dart';
import 'package:team_draw/shared/ui/list_item/player_goals_list_item.dart';

class MatchResultComponent extends StatelessWidget {
  final TeamMatch match;
  final TeamInformation teamInformation;
  final List<String> playersGoalAtTime;

  const MatchResultComponent(
      {super.key,
      required this.match,
      required this.teamInformation,
      required this.playersGoalAtTime});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 25),
            MatchScoreComponent(match: match),
            TeamsInformationComponent(teamsInformation: teamInformation),
            const SizedBox(height: 30),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PlayerGoalsListItem(
                    match: match, playerGoalAtTime: playersGoalAtTime[index]);
              },
              itemCount: playersGoalAtTime.length,
            ),
          ],
        ),
      ),
    );
  }
}
