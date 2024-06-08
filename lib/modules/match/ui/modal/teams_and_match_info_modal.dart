import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/match/ui/component/match_info_component.dart';
import 'package:team_draw/modules/match/ui/component/team_info_component.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';

class TeamsAndMatchInfoModal extends StatelessWidget {
  final TeamMatch teamMatch;
  final List<PlayerScore> playersScoreTeamOne;
  final List<PlayerScore> playersScoreTeamTwo;
  final TeamInformation teamInformation;

  const TeamsAndMatchInfoModal(
      {super.key,
      required this.teamMatch,
      required this.playersScoreTeamOne,
      required this.playersScoreTeamTwo,
      required this.teamInformation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TeamInfoComponent(
              playersScore: playersScoreTeamOne, team: teamMatch.teamOne!),
          MatchInfoComponent(
              teamMatch: teamMatch, teamInformation: teamInformation),
          TeamInfoComponent(
              playersScore: playersScoreTeamTwo, team: teamMatch.teamTwo!),
        ],
      ),
    );
  }
}
