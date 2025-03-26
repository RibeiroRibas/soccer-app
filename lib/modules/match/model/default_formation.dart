import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class DefaultFormation extends TeamFormation {
  final int numberOfPlayers;
  Map<Position, Player?> formation = {};

  DefaultFormation(super.players, super.teamColor, super.onSelectedPlayer,
      super.onLongPlayerPress,
      {required this.numberOfPlayers});

  void _setPlayersAndPositions() {
    List<Player> playersInImprovisedPosition = [];
    setGoalKeeper();
    for (Player player in players) {
      _setPlayersAtDefinedPosition(player, playersInImprovisedPosition);
    }
    while (playersInImprovisedPosition.isNotEmpty) {
      Player player = playersInImprovisedPosition.first;
      _setPlayerAtImprovisedPosition(player);
      playersInImprovisedPosition.removeWhere((p) => p.id == player.id);
    }
  }

  void _setPlayersAtDefinedPosition(
      Player player, List<Player> playersInImprovisedPosition) {
    if (player.improvisedPosition != null) {
      if (formation.containsKey(player.improvisedPosition)) {
        if (formation[player.improvisedPosition] == null) {
          formation[player.improvisedPosition!] = player;
        }
      }
    } else if (formation.containsKey(player.principalPosition)) {
      if (formation[player.principalPosition] == null) {
        formation[player.principalPosition!] = player;
      } else {
        playersInImprovisedPosition.add(player);
      }
    } else {
      playersInImprovisedPosition.add(player);
    }
  }

  void _setPlayerAtImprovisedPosition(Player player) {
    if (Position.defensivePositions()
        .any((p) => p == player.principalPosition)) {
      _setImprovisedPositionByDefinedOrder(
          Position.orderOfChangingDefensivePlayers(), player);
    } else if (Position.defensiveMidfielderPositions()
        .any((p) => p == player.principalPosition)) {
      _setImprovisedPositionByDefinedOrder(
          Position.orderOfChangingDefensiveMidfielderPlayers(), player);
    } else if (Position.midfielderPositions()
        .any((p) => p == player.principalPosition)) {
      _setImprovisedPositionByDefinedOrder(
          Position.orderOfChangingMidfielderPlayers(), player);
    } else if (Position.forwardPositions()
        .any((p) => p == player.principalPosition)) {
      _setImprovisedPositionByDefinedOrder(
          Position.orderOfChangingForwardPlayers(), player);
    }
  }

  void _setImprovisedPositionByDefinedOrder(
      List<Position> positions, Player player) {
    for (Position position in positions) {
      if (formation.containsKey(position)) {
        if (formation[position] == null) {
          player.improvisedPosition = position;
          formation[position] = player;
          break;
        }
      }
    }
  }

  void _setTeamFormation() {
    switch (numberOfPlayers) {
      case 1:
        formation = {
          Position.goalkeeper: null,
        };
      case 2:
        formation = {
          Position.goalkeeper: null,
          Position.midfielder: null,
        };
      case 3:
        formation = {
          Position.goalkeeper: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
        };
      case 4:
        formation = {
          Position.goalkeeper: null,
          Position.leftDefender: null,
          Position.midfielder: null,
          Position.forward: null,
        };
      case 5:
        formation = {
          Position.goalkeeper: null,
          Position.defender: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
          Position.forward: null
        };
      case 6:
        formation = {
          Position.goalkeeper: null,
          Position.leftDefender: null,
          Position.rightDefender: null,
          Position.midfielder: null,
          Position.leftWinger: null,
          Position.rightWinger: null
        };
      case 7:
        formation = {
          Position.goalkeeper: null,
          Position.leftDefender: null,
          Position.defender: null,
          Position.rightDefender: null,
          Position.midfielder: null,
          Position.leftWinger: null,
          Position.rightWinger: null
        };
      case 8:
        formation = {
          Position.goalkeeper: null,
          Position.leftBack: null,
          Position.defender: null,
          Position.rightBack: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
          Position.midfielder: null,
          Position.forward: null
        };
      case 9:
        formation = {
          Position.goalkeeper: null,
          Position.leftBack: null,
          Position.defender: null,
          Position.rightBack: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
          Position.midfielder: null,
          Position.leftWinger: null,
          Position.rightWinger: null
        };
      case 10:
        formation = {
          Position.goalkeeper: null,
          Position.leftBack: null,
          Position.leftDefender: null,
          Position.rightDefender: null,
          Position.rightBack: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
          Position.midfielder: null,
          Position.leftWinger: null,
          Position.rightWinger: null
        };
      case 11:
        formation = {
          Position.goalkeeper: null,
          Position.leftBack: null,
          Position.leftDefender: null,
          Position.rightDefender: null,
          Position.rightBack: null,
          Position.leftDefensiveMidfielder: null,
          Position.rightDefensiveMidfielder: null,
          Position.midfielder: null,
          Position.leftWinger: null,
          Position.forward: null,
          Position.rightWinger: null
        };
    }
  }

  @override
  void init(Player? selectedPlayer) {
    super.selectedPlayer = selectedPlayer;
    _setTeamFormation();
    _setPlayersAndPositions();
  }

  @override
  List<Widget> getGoalKeeper() {
    List<Widget> playersComponent = [];
    addComponent(formation[Position.goalkeeper], playersComponent);
    return playersComponent;
  }

  @override
  void addComponent(Player? player, List<Widget> playersComponent) {
    if (player != null) {
      playersComponent.add(GestureDetector(
        child: PlayerNameAndPositionComponent(
            position: player.improvisedPosition ?? player.principalPosition,
            playerName: formatName(player.name!),
            positionColor: resolveSelectedPlayerColor(player)),
        onTap: () => super.onSelectedPlayer(player),
        onLongPress: () => super.onLongPlayerPress(player),
      ));
    }
  }

  @override
  List<Widget> getDefendersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defensivePositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getDefendersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defensivePositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getDefensiveMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defensiveMidfielderPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getDefensiveMidfieldersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position
        in Position.defensiveMidfielderPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getForwardsLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getForwardsRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> getMidfieldersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }
}
