import 'package:team_draw/models/match.dart';
import 'package:team_draw/models/player.dart';

import 'position.dart';

class Team {
  String name;
  String acronym;
  String shield;
  List<Player> players;
  List<Match> matches = [];
  Map<Position, double> overallByPosition = {};
  Map<Map<Position, double>, double> teamOverall = {};

  Team({required this.name,
    required this.acronym,
    required this.shield,
    required this.players});

  Map<Map<Position, double>, double> get getTeamOverall {
    _setDefaultOverallByPosition();
    double teamOverall = 0.0;
    for (var player in players) {
      teamOverall = teamOverall +player.overall;
        _increasePositionOverall(position: player.principalPosition ,weight: 1);
      if (player.secondaryPosition != null) {
        _increasePositionOverall(position: player.secondaryPosition! ,weight: 0.5);
      }
    }
    this.teamOverall[overallByPosition] = teamOverall; 
    return this.teamOverall;
  }

  void _increasePositionOverall({required Position position, required double weight}) {
    overallByPosition[position] = (overallByPosition[position]! + weight);
  }

  void _setDefaultOverallByPosition() {
    overallByPosition[Position.forward] = 0.0;
    overallByPosition[Position.defender] = 0.0;
    overallByPosition[Position.midfielder] = 0.0;
    overallByPosition[Position.goalkeeper] = 0.0;
    overallByPosition[Position.fullBack] = 0.0;
  }
}
