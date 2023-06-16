import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app_navigator/model/team_overall.dart';
import 'package:team_draw/shared/extensions/team_overall_map_extension.dart';

class Team {
  String name;
  String acronym;
  String shield;
  List<Player> players;
  int numberOfStartingPlayers;

  Team({
    required this.name,
    required this.acronym,
    required this.shield,
    required this.players,
    required this.numberOfStartingPlayers,
  });

  bool hasPlayerBackup() {
    return numberOfStartingPlayers < players.length;
  }

  bool hasGoalKeeper() {
    return players
        .any((element) => element.principalPosition == Position.goalkeeper);
  }

  TeamOverall calculateTeamOverall() {
    TeamOverall teamOverall = TeamOverall(this);
    if (hasGoalKeeper()) {
      _calculateWithGoalKeeper(teamOverall);
    } else {
      _calculateWithoutGoalKeeper(teamOverall);
    }
    return teamOverall;
  }

  void _calculateOverall(TeamOverall teamOverall) {
    for (Player player in teamOverall.team.players) {
      _increaseOverallPrincipalPosition(player, teamOverall);
      if (player.secondaryPosition != null) {
        _increaseOverallSecondaryPosition(player, teamOverall);
      }
    }
  }

  void _increaseOverallSecondaryPosition(
      Player player, TeamOverall teamOverall) {
    const int secondaryPositionWeight = 2;
    double playerOverall = player.overall / secondaryPositionWeight;
    teamOverall.overallByPosition.increaseOverallByPosition(
      player.secondaryPosition!,
      playerOverall,
    );
    teamOverall.teamOverall += playerOverall;
  }

  void _increaseOverallPrincipalPosition(
      Player player, TeamOverall teamOverall) {
    teamOverall.overallByPosition.increaseOverallByPosition(
      player.principalPosition,
      player.overall,
    );
    teamOverall.teamOverall += player.overall;
  }

  void _calculateWithoutGoalKeeper(TeamOverall teamOverall) {
    _calculateOverall(teamOverall);
    double playerOverallAsGoalKeeper =
        (teamOverall.teamOverall / 2) / teamOverall.team.players.length;
    teamOverall.teamOverall -= playerOverallAsGoalKeeper;
    int result = _numberOfStartingPlayerWithoutGoalKeeper(teamOverall.team);
    teamOverall.teamOverall *= result;
    teamOverall.teamOverall /= teamOverall.team.players.length;
    teamOverall.teamOverall += playerOverallAsGoalKeeper;
    teamOverall.overallByPosition.updateOverallWithoutGoalKeeper(
      teamOverall.team,
      playerOverallAsGoalKeeper,
      result,
    );
    _calculateOverallByPositionWithoutGoalKeeper(
      playerOverallAsGoalKeeper,
      teamOverall,
    );
  }

  void _calculateOverallByPositionWithoutGoalKeeper(
    double playerOverallAsGoalKeeper,
    TeamOverall teamOverall,
  ) {
    Map<Position, double> overallByPositionAux = {};
    overallByPositionAux.addAll(teamOverall.overallByPosition);
    overallByPositionAux.removeWhere(
        (position, value) => value == 0 || position == Position.goalkeeper);
    double resultAux = playerOverallAsGoalKeeper / overallByPositionAux.length;
    overallByPositionAux.forEach((positionAux, valueAux) {
      teamOverall.overallByPosition.updateAll((position, value) {
        if (positionAux == position) {
          return valueAux - resultAux;
        } else {
          return value;
        }
      });
    });
  }

  int _numberOfStartingPlayerWithoutGoalKeeper(Team team) {
    int numberOfPlayerBackup =
        team.players.length - team.numberOfStartingPlayers;
    return team.players.length - numberOfPlayerBackup - 1;
  }

  void _calculateWithGoalKeeper(TeamOverall teamOverall) {
    if (teamOverall.hasPlayerBackup()) {
      Player goalKeeper = teamOverall.getGoalKeeper();
      teamOverall.team.players.remove(goalKeeper);
      _calculateOverallWithPlayerBackup(teamOverall);
      teamOverall.teamOverall += goalKeeper.overall;
      teamOverall.overallByPosition
          .updateOverallWithGoalKeeper(teamOverall.team, goalKeeper.overall);
      teamOverall.team.players.add(goalKeeper);
    } else {
      _calculateOverall(teamOverall);
    }
  }

  void _calculateOverallWithPlayerBackup(TeamOverall teamOverall) {
    int numberOfPlayerBackup = teamOverall.getNumberOfPlayerBackup();
    _calculateOverall(teamOverall);
    int numberOfPlayers = teamOverall.team.players.length;
    double result =
        teamOverall.teamOverall * (numberOfPlayers - numberOfPlayerBackup);
    teamOverall.teamOverall = result / numberOfPlayers;
  }
}
