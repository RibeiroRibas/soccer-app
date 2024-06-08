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

  void clearValues() {
    assert(Position.values.length == length);
    this[Position.forward] = 0.0;
    this[Position.defender] = 0.0;
    this[Position.midfielder] = 0.0;
    this[Position.goalkeeper] = 0.0;
    this[Position.leftBack] = 0.0;
    this[Position.rightBack] = 0.0;
    this[Position.leftWinger] = 0.0;
    this[Position.rightWinger] = 0.0;
  }

  int _numberOfPlayerBackup(
    List<Player> players,
    int numberOfStartingPlayers,
  ) =>
      players.length - numberOfStartingPlayers;
}
