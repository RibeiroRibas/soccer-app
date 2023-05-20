import 'package:team_draw/models/position.dart';

class Player {
  String name;
  Position principalPosition;
  Position? secondaryPosition;
  int overall;

  Player({
    required this.name,
    required this.overall,
    required this.principalPosition,
    this.secondaryPosition,
  });
}
