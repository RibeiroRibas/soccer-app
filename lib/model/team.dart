import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team_overall.dart';
import 'package:team_draw/model/team_shield.dart';

class Team {
  int? id;
  String? name;
  String? _acronym;
  TeamShield? shield;
  List<Player>? players;
  int? numberOfStartingPlayers;
  TeamOverall? _teamOverall;

  TeamOverall get teamOverall {
    if (_teamOverall == null) calculateOverall();
    return _teamOverall!;
  }

  String get acronym {
    return _acronym ?? "TES";
  }

  set acronym(String acronym) {
    _acronym = acronym;
  }

  Team({
    this.id = 0,
    this.name,
    String? acronym,
    this.shield,
    this.players,
    this.numberOfStartingPlayers,
  }) {
    _acronym = acronym;
  }

  bool hasPlayerBackup() {
    return numberOfStartingPlayers! < players!.length;
  }

  bool hasGoalKeeper() {
    return players!
        .any((element) => element.principalPosition == Position.goalkeeper);
  }

  void calculateOverall() async {
    _teamOverall = TeamOverall(players!);
  }

  Player getGoalKeeper() =>
      players!.firstWhere((player) => player.isGoalKeeper());

  int getNumberOfPlayerBackup() => players!.length - numberOfStartingPlayers!;

  bool isSameTeam(List<Player> otherPlayers) {
    for (Player player in players!) {
      bool match =
          otherPlayers.any((otherPlayer) => otherPlayer.name == player.name);
      if (!match) {
        return false;
      }
    }
    return true;
  }

  bool isPresent() {
    return name != null && shield != null;
  }

  List<String> geInformation() {
    List<String> teamInformation = [];

    teamInformation.add(teamOverall.value.toStringAsFixed(1));

    teamInformation.add(
        teamOverall.overallByPosition[Position.forward]!.toStringAsFixed(1));

    teamInformation.add(
        teamOverall.overallByPosition[Position.defender]!.toStringAsFixed(1));

    teamInformation.add(
        teamOverall.overallByPosition[Position.midfielder]!.toStringAsFixed(1));

    return teamInformation;
  }

}
