import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';

extension TeamOverallExtension on Map<Position, double> {
  void updateOverallWithGoalKeeper(List<Player> players,
      int numberOfStartingPlayers, double goalKeeperOverall) {
    updateAll((key, overall) {
      if (key == Position.goalkeeper) return goalKeeperOverall.toDouble();
      return (overall *
          (players.length -
              _numberOfPlayerBackup(players, numberOfStartingPlayers)) /
          players.length);
    });
  }

  void updateOverallWithoutGoalKeeper(
    List<Player> players,
    double playerOverallAsGoalKeeper,
    int numberOfStatingPLayer,
  ) {
    updateAll((key, overall) {
      if (key == Position.goalkeeper) return playerOverallAsGoalKeeper;
      double result = overall * numberOfStatingPLayer;
      return result / players.length;
    });
  }

  void increaseOverallByPosition(Position position, double overall) {
    this[position] = this[position]! + overall;
  }

  int _numberOfPlayerBackup(
    List<Player> players,
    int numberOfStartingPlayers,
  ) =>
      players.length - numberOfStartingPlayers;
}
