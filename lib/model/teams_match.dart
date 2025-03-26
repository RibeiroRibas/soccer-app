import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';

class TeamsMatch {
  int? id;
  Team? teamOne;
  Team? teamTwo;
  int scoreTeamOne;
  int scoreTeamTwo;
  DateTime? matchDate;
  List<PlayerGoals>? matchGoals;

  TeamsMatch(
      {this.id = 0,
      this.teamOne,
      this.teamTwo,
      this.scoreTeamOne = 0,
      this.scoreTeamTwo = 0,
      this.matchDate,
      this.matchGoals});

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

  void setPlayerGoal(
    bool isIncreaseScore,
    Player player,
    String goalTime,
    bool isScoreTeamOne,
  ) {
    matchGoals = matchGoals ?? [];
    if (matchGoals!.any((playerGoal) => playerGoal.player.id == player.id)) {
      for (int i = 0; i < matchGoals!.length; i++) {
        if (matchGoals![i].player.id == player.id) {
          if (isIncreaseScore) {
            matchGoals![i].isOwnGoals.add(_isOwnGoal(isScoreTeamOne, player));
            matchGoals![i].goalTime.add(goalTime);
          } else {
            matchGoals![i].goalTime.removeLast();
            matchGoals![i].isOwnGoals.removeLast();
            if (matchGoals![i].goalTime.isEmpty) {
              matchGoals!.removeAt(i);
            }
          }
        }
      }
    } else {
      matchGoals!.add(PlayerGoals(
          player: player,
          goalTime: [goalTime],
          isOwnGoal: _isOwnGoal(isScoreTeamOne, player)));
    }
  }

  bool _isOwnGoal(bool isScoreTeamOne, Player player) =>
      isScoreTeamOne && teamTwo!.players!.any((p) => p.id == player.id) ||
      !isScoreTeamOne && teamOne!.players!.any((p) => p.id == player.id);

  TeamInformation getTeamsInformation() {
    List<String> teamOneInformation = teamOne!.geInformation();
    List<String> teamTwoInformation = teamTwo!.geInformation();
    return TeamInformation(teamOneInformation, teamTwoInformation);
  }

  bool isTeamOnePlayerGoalOrIsOwnGoal(PlayerGoals playerGoals) {
    return teamOne!.players!.any((player) =>
            playerGoals.player.id == player.id &&
            playerGoals.isOwnGoals.any((isOwnGoal) => !isOwnGoal)) ||
        teamTwo!.players!.any((player) =>
            playerGoals.player.id == player.id &&
            playerGoals.isOwnGoals.any((isOwnGoal) => isOwnGoal));
  }

  bool isTeamTwoPlayerGoalOrIsOwnGoal(PlayerGoals playerGoals) {
    return teamTwo!.players!.any((player) =>
            playerGoals.player.id == player.id &&
            playerGoals.isOwnGoals.any((isOwnGoal) => !isOwnGoal)) ||
        teamOne!.players!.any((player) =>
            playerGoals.player.id == player.id &&
            playerGoals.isOwnGoals.any((isOwnGoal) => isOwnGoal));
  }
}
