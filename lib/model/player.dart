import 'package:team_draw/model/position.dart';

class Player {
  String name;
  Position principalPosition;
  Position? secondaryPosition;
  double overall;

  Player({
    required this.name,
    required this.overall,
    required this.principalPosition,
    this.secondaryPosition,
  });

  bool isGoalKeeper() {
    return principalPosition == Position.goalkeeper;
  }
}
