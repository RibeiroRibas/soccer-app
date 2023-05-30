import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/team.dart';

class TeamMatch {
  Team teamOne;
  Team teamTwo;
  int scoreTeamOne;
  int scoreTeamTwo;
  DateTime matchDate;

  TeamMatch(
      {required this.teamOne,
      required this.teamTwo,
      required this.scoreTeamOne,
      required this.scoreTeamTwo,
      required this.matchDate});

  MatchResult getMatchResult({required Team team}) {
    MatchResult resultTeamOne = MatchResult.draw;
    MatchResult resultTeamTwo = MatchResult.draw;

    if (scoreTeamOne > scoreTeamTwo) {
      resultTeamOne = MatchResult.victory;
      resultTeamTwo = MatchResult.defeat;
    } else if (scoreTeamOne < scoreTeamTwo) {
      resultTeamOne = MatchResult.defeat;
      resultTeamTwo = MatchResult.victory;
    }

    if (team == teamOne) {
      return resultTeamOne;
    }

    return resultTeamTwo;
  }

  int getGoalsScored({required Team team}) {
    if (team == teamOne) return scoreTeamOne;
    return scoreTeamTwo;
  }

  int getGoalsConceded({required Team team}) {
    if (team == teamOne) return scoreTeamTwo;
    return scoreTeamOne;
  }
}
