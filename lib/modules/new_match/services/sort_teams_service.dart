import 'dart:math';

import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

class SortTeamsService {
  List<TeamMatch> sortTeamsMatch(List<Player> players, MatchSettings settings) {
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
    for (int i = 0; i < settings.numberOfTeams!; i++) {
      Team team = Team();
      team.players = [];
      do {
        if (!team.hasGoalKeeper() && goalKeepers.isNotEmpty) {
          _addPlayer(goalKeepers, team, players);
        }
        if (forwards.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(forwards, team, players);
        }
        if (midfielders.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(midfielders, team, players);
        }
        if (defenders.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(defenders, team, players);
        }
        if (leftBacks.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(leftBacks, team, players);
        }
        if (rightBacks.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(rightBacks, team, players);
        }
      } while (team.players!.length < settings.numberOfStartingPlayers!);
      team.numberOfStartingPlayers = settings.numberOfStartingPlayers;
      team.calculateTeamOverall();
      teams.add(team);
    }

    while (players.isNotEmpty) {
      List<Team> teamsWithGoalKeeper = [];
      List<Team> teamsWithoutGoalKeeper = [];
      for (var team in teams) {
        if (team.hasGoalKeeper()) {
          teamsWithGoalKeeper.add(team);
        } else {
          teamsWithoutGoalKeeper.add(team);
        }
      }

      Team? teamWithGoalKeeperAndMinusPlayers = teamsWithGoalKeeper.firstWhere(
          (team) => teams.any((element) =>
              element != team &&
              element.players!.length >= team.players!.length),
          orElse: () => Team());

      if (teamWithGoalKeeperAndMinusPlayers.players != null) {
        int playerIndex = Random().nextInt(players.length);
        teamWithGoalKeeperAndMinusPlayers.players!
            .add(players.elementAt(playerIndex));
        players.removeAt(playerIndex);
      } else {
        for (var team in teamsWithGoalKeeper) {
          if (players.isNotEmpty) {
            int playerIndex = Random().nextInt(players.length);
            team.players!.add(players.elementAt(playerIndex));
            players.removeAt(playerIndex);
          }
        }
      }

      if (players.isNotEmpty) {
        Team? teamWithoutGoalKeeperAndMinusPlayers =
            teamsWithoutGoalKeeper.firstWhere(
                (team) => teams.any((element) =>
                    element != team &&
                    element.players!.length >= team.players!.length),
                orElse: () => Team());

        if (teamWithoutGoalKeeperAndMinusPlayers.players != null) {
          int playerIndex = Random().nextInt(players.length);
          teamWithoutGoalKeeperAndMinusPlayers.players!
              .add(players.elementAt(playerIndex));
          players.removeAt(playerIndex);
        } else {
          for (var team in teamsWithoutGoalKeeper) {
            if (players.isNotEmpty) {
              int playerIndex = Random().nextInt(players.length);
              team.players!.add(players.elementAt(playerIndex));
              players.removeAt(playerIndex);
            }
          }
        }
      }
    }

    List<TeamMatch> matches = [];
    while (teams.length > 1) {
      Team team1 = teams.first;
      teams.remove(team1);
      for (Team team2 in teams) {
        TeamMatch teamMatch = TeamMatch(teamOne: team1, teamTwo: team2);
        matches.add(teamMatch);
      }
    }

    return matches;
  }

  void _addPlayer(
      List<Player> playersByPosition, Team team, List<Player> players) {
    int playerIndex = Random().nextInt(playersByPosition.length);
    team.players!.add(playersByPosition.elementAt(playerIndex));
    players.remove(playersByPosition.elementAt(playerIndex));
    playersByPosition.removeAt(playerIndex);
  }
}
