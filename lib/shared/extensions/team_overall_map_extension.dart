import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';

extension TeamOverallExtension on Map<Position, double> {
  void updateOverallWithGoalKeeper(Team team, double goalKeeperOverall) {
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