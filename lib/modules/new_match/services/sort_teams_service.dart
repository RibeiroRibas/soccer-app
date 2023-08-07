import 'dart:math';

import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

class SortTeamsService {
  Future<List<TeamMatch>>  sortTeamsMatch(List<Player> players, MatchSettings settings) async{
    List<Player> goalKeepers = [];
    List<Player> forwards = [];
    List<Player> midfielders = [];
    List<Player> defenders = [];
    List<Player> leftBacks = [];
    List<Player> rightBacks = [];
    for (Player player in players) {
      if (player.isGoalKeeper()) {
        goalKeepers.add(player);
      } else if (player.isForward()) {
        forwards.add(player);
      } else if (player.isMidfielder()) {
        midfielders.add(player);
      } else if (player.isDefender()) {
        defenders.add(player);
      } else if (player.isLeftBack()) {
        leftBacks.add(player);
      } else if (player.isRightBack()) {
        rightBacks.add(player);
      }
    }

    List<Team> teams = [];
    double teamsOverall = 0;
    for (int i = 0; i < settings.numberOfTeams!; i++) {
      Team team = Team();
      team.players = [];
      do {
        if (!team.hasGoalKeeper() && goalKeepers.isNotEmpty) {
          int playerIndex = Random().nextInt(goalKeepers.length);
          team.players!.add(goalKeepers.elementAt(playerIndex));
          players.remove(goalKeepers.elementAt(playerIndex));
          goalKeepers.removeAt(playerIndex);
        }
        if (forwards.isNotEmpty && team.players!.length < settings.numberOfStartingPlayers!) {
          int playerIndex = Random().nextInt(forwards.length);
          team.players!.add(forwards.elementAt(playerIndex));
          players.remove(forwards.elementAt(playerIndex));
          forwards.removeAt(playerIndex);
        }
        if (midfielders.isNotEmpty && team.players!.length < settings.numberOfStartingPlayers!) {
          int playerIndex = Random().nextInt(midfielders.length);
          team.players!.add(midfielders.elementAt(playerIndex));
          players.remove(midfielders.elementAt(playerIndex));
          midfielders.removeAt(playerIndex);
        }
        if (defenders.isNotEmpty && team.players!.length < settings.numberOfStartingPlayers!) {
          int playerIndex = Random().nextInt(defenders.length);
          team.players!.add(defenders.elementAt(playerIndex));
          players.remove(defenders.elementAt(playerIndex));
          defenders.removeAt(playerIndex);
        }
        if (leftBacks.isNotEmpty && team.players!.length < settings.numberOfStartingPlayers!) {
          int playerIndex = Random().nextInt(leftBacks.length);
          team.players!.add(leftBacks.elementAt(playerIndex));
          players.remove(leftBacks.elementAt(playerIndex));
          leftBacks.removeAt(playerIndex);
        }
        if (rightBacks.isNotEmpty && team.players!.length < settings.numberOfStartingPlayers!) {
          int playerIndex = Random().nextInt(rightBacks.length);
          team.players!.add(rightBacks.elementAt(playerIndex));
          players.remove(rightBacks.elementAt(playerIndex));
          rightBacks.removeAt(playerIndex);
        }
      } while (team.players!.length < settings.numberOfStartingPlayers!);
      team.numberOfStartingPlayers = settings.numberOfStartingPlayers;
      team.teamOverall = team.calculateTeamOverall();
      teamsOverall += team.teamOverall!.teamOverall;
      teams.add(team);
    }

    double teamsOverallAverage = teamsOverall / settings.numberOfTeams!;
    while (players.isNotEmpty) {
      if (teams.any((element) => !element.hasGoalKeeper())) {
        for (Team team in teams) {
          if (!team.hasGoalKeeper()) {
            int playerIndex = Random().nextInt(players.length);
            team.players!.add(players.elementAt(playerIndex));
            players.removeAt(playerIndex);
          }
        }
      } else {
        for (Team team in teams) {
          if (team.teamOverall!.teamOverall <= teamsOverallAverage) {
            int playerIndex = Random().nextInt(players.length);
            team.players!.add(players.elementAt(playerIndex));
            players.removeAt(playerIndex);
          }
        }
      }
    }

    List<TeamMatch> matches = [];
    while(teams.length > 1){
      Team team1 = teams.first;
      teams.remove(team1);
      for(Team team2 in teams){
        TeamMatch teamMatch = TeamMatch(teamOne: team1,teamTwo: team2);
        matches.add(teamMatch);
      }
    }

    return matches;
  }
}