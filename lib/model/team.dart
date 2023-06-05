import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/model/player.dart';

class Team {
  String name;
  String acronym;
  String shield;
  List<Player> players;
  int numberOfStartingPlayers;
  List<TeamMatch> matches = [];

  Team({
    required this.name,
    required this.acronym,
    required this.shield,
    required this.players,
    required this.numberOfStartingPlayers,
  });

  bool hasPlayerBackup() {
    return numberOfStartingPlayers < players.length;
  }

  bool hasGoalKeeper() {
    return players.any((element) =>
    element.principalPosition == Position.goalkeeper);
    }

}
