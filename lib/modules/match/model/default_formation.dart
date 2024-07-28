import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class DefaultFormation extends TeamFormation {
  final int numberOfPlayers;
  Map<Position, Player?> formation = {};

  DefaultFormation(super.players, super.teamColor, super.onSelectedPlayer,
      super.selectedPlayers,
      {required this.numberOfPlayers});

  void _setPlayersAndPositions() {
    List<Player> playersInImprovisedPosition = [];
    setGoalKeeper();
    for (Player player in players) {
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
    formation.forEach((position, player) {
      if (formation[position] == null &&
          playersInImprovisedPosition.isNotEmpty) {
        Player player = playersInImprovisedPosition.first;
        formation[position] = player;
        playersInImprovisedPosition.remove(player);
        for (var p in players) {
          if (p == player) {
            p.improvisedPosition = position;
          }
        }
      }
    });
  }

  void _setTeamFormation() {
    switch (numberOfPlayers) {
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
  void init() {
    _setTeamFormation();
    _setPlayersAndPositions();
  }

  @override
  List<Widget> buildGoalKeeper() {
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
        onTap: () => setSelectedPlayers(player),
      ));
    }
  }

  @override
  List<Widget> buildDefendersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defenderPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildDefendersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defenderPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defensiveMidfielderPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersRightSide() {
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
  List<Widget> buildForwardsLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildForwardsRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions()) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions().reversed) {
      if (formation.containsKey(position)) {
        addComponent(formation[position], playersComponent);
      }
    }
    return playersComponent;
  }
}
