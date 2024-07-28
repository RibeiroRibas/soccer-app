import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class CustomFormation extends TeamFormation {
  bool isShowEmptyPositions;

  CustomFormation(super.players, super.teamColor, super.onSelectedPlayer,
      super.selectedPlayers,
      {required this.isShowEmptyPositions});

  @override
  List<Widget> buildGoalKeeper() {
    List<Widget> playersComponent = [];
    addComponent(goalKeeper, playersComponent);
    return playersComponent;
  }

  @override
  List<Widget> buildDefendersLeftSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.leftBack), playersComponent);

    addComponent(_findByPosition(Position.leftDefender), playersComponent);

    addComponent(_findByPosition(Position.defender), playersComponent);

    addComponent(_findByPosition(Position.rightDefender), playersComponent);

    addComponent(_findByPosition(Position.rightBack), playersComponent);

    return playersComponent;
  }

  Player _findByPosition(Position position) {
    for (var player in players) {
      if (player.improvisedPosition != null &&
          player.improvisedPosition == position) {
        return player;
      } else if (player.improvisedPosition == null &&
          player.principalPosition == position) {
        return player;
      }
    }
    return Player(name: "", principalPosition: position);
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
      if (isShowEmptyPositions) {
        playersComponent.add(GestureDetector(
          child: PlayerNameAndPositionComponent(
              position: player.principalPosition,
              playerName: player.name,
              positionColor: resolveSelectedPlayerColor(player)),
          onTap: () => setSelectedPlayers(player),
        ));
      } else {
        playersComponent.add(const PlayerNameAndPositionComponent(
          showEmptyPositions: true,
          positionColor: Colors.transparent,
          playerName: "",
        ));
      }
    }
  }

  @override
  List<Widget> buildDefendersRightSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.rightBack), playersComponent);

    addComponent(_findByPosition(Position.rightDefender), playersComponent);

    addComponent(_findByPosition(Position.defender), playersComponent);

    addComponent(_findByPosition(Position.leftDefender), playersComponent);

    addComponent(_findByPosition(Position.leftBack), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersLeftSide() {
    List<Widget> playersComponent = [];

    addComponent(
        _findByPosition(Position.leftDefensiveMidfielder), playersComponent);

    addComponent(
        _findByPosition(Position.rightDefensiveMidfielder), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildDefensiveMidfieldersRightSide() {
    List<Widget> playersComponent = [];

    addComponent(
        _findByPosition(Position.rightDefensiveMidfielder), playersComponent);

    addComponent(
        _findByPosition(Position.leftDefensiveMidfielder), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildForwardsLeftSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.leftWinger), playersComponent);

    addComponent(_findByPosition(Position.forward), playersComponent);

    addComponent(_findByPosition(Position.rightWinger), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildForwardsRightSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.rightWinger), playersComponent);

    addComponent(_findByPosition(Position.forward), playersComponent);

    addComponent(_findByPosition(Position.leftWinger), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersLeftSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.leftMidfielder), playersComponent);

    addComponent(_findByPosition(Position.midfielder), playersComponent);

    addComponent(_findByPosition(Position.rightMidfielder), playersComponent);

    return playersComponent;
  }

  @override
  List<Widget> buildMidfieldersRightSide() {
    List<Widget> playersComponent = [];

    addComponent(_findByPosition(Position.rightMidfielder), playersComponent);

    addComponent(_findByPosition(Position.midfielder), playersComponent);

    addComponent(_findByPosition(Position.leftMidfielder), playersComponent);

    return playersComponent;
  }

  @override
  void init() {
  }
}
