import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class ByPositionFormation extends TeamFormation {
  ByPositionFormation(super.players, super.teamColor, super.onSelectedPlayers,
      super.selectedPlayers);

  @override
  List<Widget> buildDefendersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defenderPositions()) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  final List<Player> playersAtSamePosition = [];

  Player _findByPosition(Position position) {
    for (var player in players) {
      if (player.principalPosition == position) {
        playersAtSamePosition.removeWhere((player2) => player2.id == player.id);
        return player;
      }
    }

    if (playersAtSamePosition.isEmpty) {
      return Player(name: "", principalPosition: position);
    } else {
      Player player = playersAtSamePosition.first;
      playersAtSamePosition.remove(player);
      player.improvisedPosition = position;
      return player;
    }
  }

  @override
  List<Widget> buildGoalKeeper() {
    List<Widget> playersComponent = [];
    addComponent(_findByPosition(Position.goalkeeper), playersComponent);
    return playersComponent;
  }

  @override
  void addComponent(Player? player, List<Widget> playersComponent) {
    if (player!.isPresent()) {
      playersComponent.add(GestureDetector(
        child: PlayerNameAndPositionComponent(
            position: player.improvisedPosition ?? player.principalPosition,
            playerName: formatName(player.name!),
            positionColor: resolveSelectedPlayerColor(player)),
        onTap: () => setSelectedPlayers(player),
      ));
    } else {
      playersComponent.add(const PlayerNameAndPositionComponent(
        showEmptyPositions: true,
        positionColor: Colors.transparent,
      ));
    }
  }

  @override
  List<Widget> buildDefendersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defenderPositions().reversed) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.defensiveMidfielderPositions()) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position
        in Position.defensiveMidfielderPositions().reversed) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildForwardsLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions()) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildForwardsRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.forwardPositions().reversed) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersLeftSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions()) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersRightSide() {
    List<Widget> playersComponent = [];
    for (Position position in Position.midfielderPositions().reversed) {
      addComponent(_findByPosition(position), playersComponent);
    }
    return playersComponent;
  }

  @override
  void init() {
    for (Player player in players) {
      player.improvisedPosition = null;
    }
    setGoalKeeper();
    for (Player player in players) {
      if (players.any((player2) =>
          player2.id != player.id &&
          player2.principalPosition == player.principalPosition)) {
        if (!playersAtSamePosition.contains(player)) {
          playersAtSamePosition.add(player);
        }
      }
    }
  }
}
