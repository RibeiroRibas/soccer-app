import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/player_strengths.dart';
import 'package:team_draw/model/player_weak_points.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';

class Player {
  String? name;
  Position? principalPosition;
  double? overall;
  List<PlayerStrengths> strengths = [];
  List<PlayerWeakPoints> weakPoints = [];

  Player({this.name, this.overall, this.principalPosition});

  bool isGoalKeeper() {
    return principalPosition == Position.goalkeeper;
  }

  PlayerScore calculateScore(List<TeamMatch> allMatches) {
    PlayerScore playerScore = PlayerScore(this);
    List<TeamMatch> matches = [];
    matches.addAll(allMatches);
    matches.removeWhere((e) =>
        !e.teamOne!.players!.contains(this) &&
        !e.teamTwo!.players!.contains(this));
    for (TeamMatch teamMatch in matches) {
      teamMatch.playerGoals!.forEach((key, value) {
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
        teamMatch.getMatchResult(team: teamMatch.teamOne!);
    bool isPlayerTeamOne =
        teamMatch.teamOne!.players!.any((element) => element == this);

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

  bool isForward() {
    return principalPosition == Position.forward;
  }

  bool isMidfielder() {
    return principalPosition == Position.midfielder;
  }

  bool isDefender() {
    return principalPosition == Position.defender;
  }

  bool isLeftBack() {
    return principalPosition == Position.leftBack;
  }

  bool isRightBack() {
    return principalPosition == Position.rightBack;
  }

  bool isWeakPointNotSelected(PlayerWeakPoints playerWeakPoints) {
    return !weakPoints.any((element) => element == playerWeakPoints);
  }

  bool isLastWeakPointAllowed() {
    return weakPoints.length == PlayerWeakPoints.all.length - 1;
  }

  bool isStrengthsNotSelected(PlayerStrengths playerStrengths) {
    return !strengths.any((element) => element == playerStrengths);
  }

  bool isLastStrengthsAllowed() {
    return strengths.length == PlayerStrengths.all.length - 1;
  }
}
