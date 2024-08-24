import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/player_strengths.dart';
import 'package:team_draw/model/player_weak_points.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/model/player_score.dart';

class Player {
  int id;
  String? name;
  Position? principalPosition;
  Position? improvisedPosition;
  double? overall;
  List<PlayerStrengths> strengths = [];
  List<PlayerWeakPoints> weakPoints = [];

  Player({this.id = 0, this.name, this.overall, this.principalPosition});

  PlayerScore calculateScore(List<TeamsMatch> allMatches) {
    PlayerScore playerScore = PlayerScore(this);
    List<TeamsMatch> matches = [];
    matches.addAll(allMatches);
    matches.removeWhere((e) =>
        !e.teamOne!.players!.contains(this) &&
        !e.teamTwo!.players!.contains(this));
    for (TeamsMatch teamMatch in matches) {
      _setPlayerGoals(teamMatch, playerScore);
      _setScore(teamMatch, playerScore);
    }
    return playerScore;
  }

  void _setPlayerGoals(TeamsMatch teamMatch, PlayerScore playerScore) {
    if (teamMatch.matchGoals != null) {
      for (PlayerGoals playerGoals in teamMatch.matchGoals!) {
        if (playerGoals.player == this) {
          playerScore.goals += playerGoals.goalTime.length;
        }
      }
    }
  }

  void _setScore(
    TeamsMatch teamMatch,
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

  bool isGoalKeeper() {
    return principalPosition == Position.goalkeeper;
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
    return weakPoints.length == PlayerWeakPoints.values.length - 1;
  }

  bool isStrengthsNotSelected(PlayerStrengths playerStrengths) {
    return !strengths.any((element) => element == playerStrengths);
  }

  bool isLastStrengthsAllowed() {
    return strengths.length == PlayerStrengths.values.length - 1;
  }

  bool isLeftWinger() {
    return principalPosition == Position.leftWinger;
  }

  bool isRightWinger() {
    return principalPosition == Position.rightWinger;
  }

  bool isLeftDefender() {
    return principalPosition == Position.leftDefender;
  }

  bool isRightDefender() {
    return principalPosition == Position.rightDefender;
  }

  bool isLeftMidfielder() {
    return principalPosition == Position.leftMidfielder;
  }

  bool isRightMidfielder() {
    return principalPosition == Position.rightMidfielder;
  }

  bool isLeftDefensiveMidfielder() {
    return principalPosition == Position.leftDefensiveMidfielder;
  }

  bool isRightDefensiveMidfielder() {
    return principalPosition == Position.rightDefensiveMidfielder;
  }

  bool isPresent() {
    return id != 0;
  }
}
