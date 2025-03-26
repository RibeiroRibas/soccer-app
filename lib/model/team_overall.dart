import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';

class TeamOverall {
  double value = 0.0;

  Map<Position, double> overallByPosition = {
    Position.forward: 0.0,
    Position.defender: 0.0,
    Position.midfielder: 0.0,
  };

  int _defenders = 0;
  int _midfielders = 0;
  int _forwards = 0;

  TeamOverall(List<Player> players) {
    for (var player in players) {
      value = value + player.overall!;
      increaseOverallByPosition(player.principalPosition!, player.overall!);
    }
    value = value / players.length;

    if(_defenders > 0){
      overallByPosition[Position.defender] =
          overallByPosition[Position.defender]! / _defenders;
    }

    if(_midfielders > 0){
      overallByPosition[Position.midfielder] =
          overallByPosition[Position.midfielder]! / _midfielders;
    }

    if(_forwards > 0){
      overallByPosition[Position.forward] =
          overallByPosition[Position.forward]! / _forwards;
    }
  }

  void increaseOverallByPosition(Position position, double overall) {
    if (_isDefensivePosition(position)) {
      overallByPosition[Position.defender] =
          overallByPosition[Position.defender]! + overall;
      _defenders++;
    } else if (_isMidfielderPosition(position)) {
      overallByPosition[Position.midfielder] =
          overallByPosition[Position.midfielder]! + overall;
      _midfielders++;
    } else if (_isForwardPosition(position)) {
      overallByPosition[Position.forward] =
          overallByPosition[Position.forward]! + overall;
      _forwards++;
    }
  }

  bool _isDefensivePosition(Position position) {
    return Position.defensivePositions().any((p) => p == position);
  }

  bool _isMidfielderPosition(Position position) {
    return Position.defensiveMidfielderPositions().any((p) => p == position) ||
        Position.midfielderPositions().any((p) => p == position);
  }

  bool _isForwardPosition(Position position) {
    return Position.forwardPositions().any((p) => p == position);
  }

}
