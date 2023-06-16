import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app_navigator/model/player_score.dart';

class Player {
  String name;
  Position principalPosition;
  Position? secondaryPosition;
  double overall;

  Player({
    required this.name,
    required this.overall,
    required this.principalPosition,
    this.secondaryPosition,
  });

  bool isGoalKeeper() {
    return principalPosition == Position.goalkeeper;
  }

  PlayerScore calculateScore(List<TeamMatch> allMatches) {
    PlayerScore playerScore = PlayerScore(this);
    List<TeamMatch> matches = [];
    matches.addAll(allMatches);
    matches.removeWhere((e) =>
        !e.teamOne.players.contains(this) && !e.teamTwo.players.contains(this));
    for (TeamMatch teamMatch in matches) {
      teamMatch.playerGoals.forEach((key, value) {
        if (key == this) {
          playerScore.goals += value;
        }
      });
      _setScore(teamMatch, playerScore);
    }
    return playerScore;
  }

  void _setScore(
    TeamMatch teamMatch,
    PlayerScore playerScore,
  ) {
    MatchResult resultTeamOne =
        teamMatch.getMatchResult(team: teamMatch.teamOne);
    bool isPlayerTeamOne =
        teamMatch.teamOne.players.any((element) => element == this);

    switch (resultTeamOne) {
      case MatchResult.victory:
        {
          if (isPlayerTeamOne) {
            playerScore.victories++;
          } else {
            playerScore.defeats++;
          }
          break;
        }
      case MatchResult.defeat:
        {
          if (isPlayerTeamOne) {
            playerScore.defeats++;
          } else {
            playerScore.victories++;
          }
          break;
        }
      case MatchResult.draw:
        {
          playerScore.draws++;
          break;
        }
    }
  }
}
