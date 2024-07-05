import 'package:team_draw/exceptions/players_goal_not_found_exception.dart';
import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';

class TeamMatch {
  int? id;
  Team? teamOne;
  Team? teamTwo;
  int scoreTeamOne;
  int scoreTeamTwo;
  DateTime? matchDate;
  List<PlayerGoals>? matchGoals;

  TeamMatch(
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

  void setPlayerGoal(bool isIncreaseScore, Player player, String goalTime) {
    matchGoals = matchGoals ?? [];
    if (matchGoals!.any((playerGoal) => playerGoal.player == player)) {
      for (int i = 0; i < matchGoals!.length; i++) {
        if (matchGoals![i].player == player) {
          if (isIncreaseScore) {
            matchGoals![i].goalTime.add(goalTime);
          } else {
            matchGoals![i].goalTime.removeLast();
            if (matchGoals![i].goalTime.isEmpty) {
              matchGoals!.removeAt(i);
            }
          }
        }
      }
    } else {
      if (isIncreaseScore) {
        matchGoals!.add(PlayerGoals(player: player, goalTime: [goalTime]));
      } else {
        throw PlayersGoalNotFoundException();
      }
    }
  }

  TeamInformation getTeamsInformation() {
    List<String> teamOneInformation = teamOne!.getTeamInformation();
    List<String> teamTwoInformation = teamTwo!.getTeamInformation();
    return TeamInformation(teamOneInformation, teamTwoInformation);
  }
}
