import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';

class TeamOverall {
  final Team team;
  double teamOverall = 0.0;
  Map<Position, double> overallByPosition = {};
  static const int secondaryPositionWeight = 2;

  TeamOverall(this.team) {
    _calculateTeamOverallAndOverallByPosition();
  }

  void _calculateOverall() {
    for (Player player in team.players) {
      _increaseOverallPrincipalPosition(player);
      if (player.secondaryPosition != null) {
        _increaseOverallSecondaryPosition(player);
      }
    }
  }

  void _increaseOverallSecondaryPosition(Player player) {
    double playerOverall = player.overall / secondaryPositionWeight;
    overallByPosition.increaseOverallByPosition(
      player.secondaryPosition!,
      playerOverall,
    );
    teamOverall = teamOverall + playerOverall;
  }

  void _increaseOverallPrincipalPosition(Player player) {
    overallByPosition.increaseOverallByPosition(
      player.principalPosition,
      player.overall.toDouble(),
    );
    teamOverall = teamOverall + player.overall.toDouble();
  }

  Map<Position, double> _getDefaultOverallByPosition() {
    return {
      Position.forward: 0.0,
      Position.defender: 0.0,
      Position.midfielder: 0.0,
      Position.goalkeeper: 0.0,
      Position.leftBack: 0.0,
      Position.rightBack: 0.0,
    };
  }

  void _calculateTeamOverallAndOverallByPosition() {
    overallByPosition = _getDefaultOverallByPosition();
    if (team.hasGoalKeeper()) {
      _calculateWithGoalKeeper();
    } else {
      _calculateWithoutGoalKeeper();
    }
  }

  void _calculateWithoutGoalKeeper() {
    _calculateOverall();
    double playerOverallAsGoalKeeper = (teamOverall / 2) / team.players.length;
    teamOverall = teamOverall - playerOverallAsGoalKeeper;
    int result = _numberOfStartingPlayerWithoutGoalKeeper();
    teamOverall = teamOverall * result;
    teamOverall = teamOverall / team.players.length;
    teamOverall = teamOverall + playerOverallAsGoalKeeper;
    overallByPosition.updateOverallWithoutGoalKeeper(
      team,
      playerOverallAsGoalKeeper,
      result,
    );
    _calculateOverallByPositionWithoutGoalKeeper(playerOverallAsGoalKeeper);
  }

  void _calculateOverallByPositionWithoutGoalKeeper(double playerOverallAsGoalKeeper) {
    Map<Position, double> overallByPositionAux = {};
    overallByPositionAux.addAll(overallByPosition);
    overallByPositionAux.removeWhere(
        (position, value) => value == 0 || position == Position.goalkeeper);
    double resultAux = playerOverallAsGoalKeeper / overallByPositionAux.length;
    overallByPositionAux.forEach((positionAux, valueAux) {
      overallByPosition.updateAll((position, value) {
        if (positionAux == position) {
          return valueAux - resultAux;
        } else {
          return value;
        }
      });
    });
  }

  int _numberOfStartingPlayerWithoutGoalKeeper() {
    int numberOfPlayerBackup =
        team.players.length - team.numberOfStartingPlayers;
    return team.players.length - numberOfPlayerBackup - 1;
  }

  void _calculateWithGoalKeeper() {
    if (team.hasPlayerBackup()) {
      Player goalKeeper = _getGoalKeeper();
      team.players.remove(goalKeeper);
      teamOverall = _calculateOverallWithPlayerBackup() + goalKeeper.overall;
      overallByPosition.updateOverallWithGoalKeeper(team, goalKeeper.overall);
      team.players.add(goalKeeper);
    } else {
      _calculateOverall();
    }
  }

  Player _getGoalKeeper() =>
      team.players.singleWhere((player) => player.isGoalKeeper());

  double _calculateOverallWithPlayerBackup() {
    int numberOfPlayerBackup =
        team.players.length - team.numberOfStartingPlayers;
    _calculateOverall();
    teamOverall = (teamOverall * (team.players.length - numberOfPlayerBackup)) /
        team.players.length;
    return teamOverall;
  }
}

extension _TeamOverall on Map<Position, double> {
  void updateOverallWithGoalKeeper(Team team, int goalKeeperOverall) {
    updateAll((key, overall) {
      if (key == Position.goalkeeper) return goalKeeperOverall.toDouble();
      return (overall *
          (team.players.length - _numberOfPlayerBackup(team)) /
          team.players.length);
    });
  }

  void updateOverallWithoutGoalKeeper(
    Team team,
    double playerOverallAsGoalKeeper,
    int numberOfStatingPLayer,
  ) {
    updateAll((key, overall) {
      if (key == Position.goalkeeper) return playerOverallAsGoalKeeper;
      double result = overall * numberOfStatingPLayer;
      return result / team.players.length;
    });
  }

  void increaseOverallByPosition(Position position, double overall) {
    this[position] = this[position]! + overall;
  }

  int _numberOfPlayerBackup(Team team) =>
      team.players.length - team.numberOfStartingPlayers;
}
