import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/model/team_overall.dart';
import 'package:team_draw/shared/extensions/team_overall_map_extension.dart';

class Team {
  String? name;
  String? acronym;
  String? shield;
  List<Player>? players;
  int? numberOfStartingPlayers;
  TeamOverall teamOverall = TeamOverall();

  Team({
    this.name,
    this.acronym,
    this.shield,
    this.players,
    this.numberOfStartingPlayers,
  });

  bool hasPlayerBackup() {
    return numberOfStartingPlayers! < players!.length;
  }

  bool hasGoalKeeper() {
    return players!
        .any((element) => element.principalPosition == Position.goalkeeper);
  }

  void calculateTeamOverall() async {
    if (hasGoalKeeper()) {
      _calculateWithGoalKeeper();
    } else {
      _calculateWithoutGoalKeeper();
    }
  }

  void _calculateOverall() {
    for (Player player in players!) {
      _increaseOverallPrincipalPosition(player);
      if (player.secondaryPosition != null) {
        _increaseOverallSecondaryPosition(player);
      }
    }
  }

  void _increaseOverallSecondaryPosition(Player player) {
    const int secondaryPositionWeight = 2;
    double playerOverall = player.overall! / secondaryPositionWeight;
    teamOverall.overallByPosition.increaseOverallByPosition(
      player.secondaryPosition!,
      playerOverall,
    );
    teamOverall.value += playerOverall;
  }

  void _increaseOverallPrincipalPosition(Player player) {
    teamOverall.overallByPosition.increaseOverallByPosition(
      player.principalPosition!,
      player.overall!,
    );
    teamOverall.value += player.overall!;
  }

  void _calculateWithoutGoalKeeper() {
    _calculateOverall();
    double playerOverallAsGoalKeeper =
        (teamOverall.value / 2) / players!.length;
    teamOverall.value -= playerOverallAsGoalKeeper;
    int result = _numberOfStartingPlayerWithoutGoalKeeper();
    teamOverall.value *= result;
    teamOverall.value /= players!.length;
    teamOverall.value += playerOverallAsGoalKeeper;
    teamOverall.overallByPosition.updateOverallWithoutGoalKeeper(
      players!,
      playerOverallAsGoalKeeper,
      result,
    );
    _calculateOverallByPositionWithoutGoalKeeper(playerOverallAsGoalKeeper);
  }

  void _calculateOverallByPositionWithoutGoalKeeper(
    double playerOverallAsGoalKeeper,
  ) {
    Map<Position, double> overallByPositionAux = {};
    overallByPositionAux.addAll(teamOverall.overallByPosition);
    overallByPositionAux.removeWhere(
        (position, value) => value == 0 || position == Position.goalkeeper);
    double resultAux = playerOverallAsGoalKeeper / overallByPositionAux.length;
    overallByPositionAux.forEach((positionAux, valueAux) {
      teamOverall.overallByPosition.updateAll((position, value) {
        if (positionAux == position) {
          return valueAux - resultAux;
        } else {
          return value;
        }
      });
    });
  }

  int _numberOfStartingPlayerWithoutGoalKeeper() {
    int numberOfPlayerBackup = players!.length - numberOfStartingPlayers!;
    return players!.length - numberOfPlayerBackup - 1;
  }

  void _calculateWithGoalKeeper() {
    if (hasPlayerBackup()) {
      Player goalKeeper = getGoalKeeper();
      players!.remove(goalKeeper);
      _calculateOverallWithPlayerBackup();
      teamOverall.value += goalKeeper.overall!;
      teamOverall.overallByPosition.updateOverallWithGoalKeeper(
          players!, numberOfStartingPlayers!, goalKeeper.overall!);
      players!.add(goalKeeper);
    } else {
      _calculateOverall();
    }
  }

  void _calculateOverallWithPlayerBackup() {
    int numberOfPlayerBackup = getNumberOfPlayerBackup();
    _calculateOverall();
    int numberOfPlayers = players!.length;
    double result =
        teamOverall.value * (numberOfPlayers - numberOfPlayerBackup);
    teamOverall.value = result / numberOfPlayers;
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
}
