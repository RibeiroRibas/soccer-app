import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/match/ui/section/match_info_section.dart';
import 'package:team_draw/modules/match/ui/section/team_info_section.dart';
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
          TeamInfoSection(
              playersScore: playersScoreTeamOne, team: teamMatch.teamOne!),
          MatchInfoSection(
              teamMatch: teamMatch, teamInformation: teamInformation),
          TeamInfoSection(
              playersScore: playersScoreTeamTwo, team: teamMatch.teamTwo!),
        ],
      ),
    );
  }
}
