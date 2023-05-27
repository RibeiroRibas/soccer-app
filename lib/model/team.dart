import 'package:team_draw/model/match.dart';
import 'package:team_draw/model/player.dart';

import 'position.dart';

class Team {
  String name;
  String acronym;
  String shield;
  List<Player> players;
  List<Match> matches;
  int numberOfStartingPlayers;
  final Map<Position, double> _overallByPosition = {};
  final Map<Map<Position, double>, double> _teamOverall = {};
  // List<int>

  Team({
    required this.name,
    required this.acronym,
    required this.shield,
    required this.players,
    required this.numberOfStartingPlayers,
    this.matches = const [],
  });

  Map<Map<Position, double>, double> get getTeamOverall {
    double teamOverall = _calculateTeamOverall();
    _teamOverall[_overallByPosition] = teamOverall;
    return _teamOverall;
  }

  double _calculateTeamOverall() {
    _setDefaultOverallByPosition();
    double teamOverall = 0.0;
    for (var player in players) {
      teamOverall = _setTeamOverall(teamOverall, player);
    }
    return teamOverall;
  }

  void _increasePositionOverall(
      {required Position position, required double weight}) {
    _overallByPosition[position] = (_overallByPosition[position]! + weight);
  }

  void _setDefaultOverallByPosition() {
    _overallByPosition[Position.forward] = 0.0;
    _overallByPosition[Position.defender] = 0.0;
    _overallByPosition[Position.midfielder] = 0.0;
    _overallByPosition[Position.goalkeeper] = 0.0;
    _overallByPosition[Position.fullBack] = 0.0;
  }

  bool hasPlayerBackup() {
    return numberOfStartingPlayers < players.length;
  }

  Map<Map<Position, double>, double> get getTeamOverallWithPlayerBackup {
    double teamOverall =
        (_calculateTeamOverall() / players.length) * numberOfStartingPlayers;
    _overallByPosition.updateAll(
        (key, overall) => (overall / players.length) * numberOfStartingPlayers);
    _teamOverall[_overallByPosition] = teamOverall;
    return _teamOverall;
  }

  double _setTeamOverall(double teamOverall, Player player) {
    teamOverall = teamOverall + player.overall;
    _increasePositionOverall(position: player.principalPosition, weight: 1);
    if (player.secondaryPosition != null) {
      _increasePositionOverall(
          position: player.secondaryPosition!, weight: 0.5);
    }
    return teamOverall;
  }
}
