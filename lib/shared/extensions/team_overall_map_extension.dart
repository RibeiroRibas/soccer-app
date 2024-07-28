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
    if (_isDefensivePosition(position)) {
      this[Position.defender] = this[Position.defender]! + overall;
    } else if (_isMidfielderPosition(position)) {
      this[Position.midfielder] = this[Position.midfielder]! + overall;
    } else if (_isForwardPosition(position)) {
      this[Position.forward] = this[Position.forward]! + overall;
    }
  }

  bool _isDefensivePosition(Position position) {
    List<Position> defensivePositions = [
      Position.goalkeeper,
      Position.leftDefender,
      Position.defender,
      Position.rightDefender,
      Position.leftDefensiveMidfielder,
      Position.rightDefensiveMidfielder,
    ];
    return defensivePositions.any((p) => p == position);
  }

  bool _isMidfielderPosition(Position position) {
    List<Position> midfielderPositions = [
      Position.leftMidfielder,
      Position.midfielder,
      Position.rightMidfielder,
    ];
    return midfielderPositions.any((p) => p == position);
  }

  bool _isForwardPosition(Position position) {
    List<Position> forwardPositions = [
      Position.leftWinger,
      Position.forward,
      Position.rightWinger,
    ];
    return forwardPositions.any((p) => p == position);
  }

  void clearValues() {
    this[Position.forward] = 0.0;
    this[Position.defender] = 0.0;
    this[Position.midfielder] = 0.0;
  }

  int _numberOfPlayerBackup(
    List<Player> players,
    int numberOfStartingPlayers,
  ) =>
      players.length - numberOfStartingPlayers;
}
