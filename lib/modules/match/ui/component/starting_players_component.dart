import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class StartingPlayersComponent extends StatelessWidget {
  final bool isTeamLeftSide;
  final List<Player> players;
  final Color teamColor;

  const StartingPlayersComponent(
      {super.key,
      required this.isTeamLeftSide,
      required this.players,
      required this.teamColor});

  @override
  Widget build(BuildContext context) {
    return isTeamLeftSide
        ? Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerNameAndPositionComponent(
                      position: players.first.principalPosition,
                      playerName: _formatName(players.first.name!),
                      positionColor: teamColor)
                ],
              ),
              const SizedBox(width: 25),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildDefendersList()),
              const SizedBox(width: 25),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildMidfielderList()),
              const SizedBox(width: 25),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildForwardsList()),
            ],
          )
        : Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildForwardsList()),
              const SizedBox(width: 25),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildMidfielderList()),
              const SizedBox(width: 25),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildDefendersListRightSide()),
              const SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerNameAndPositionComponent(
                      position: players.first.principalPosition,
                      playerName: _formatName(players.first.name!),
                      positionColor: teamColor),
                ],
              ),
              const SizedBox(width: 40),
            ],
          );
  }

  List<Widget> _buildDefendersListRightSide() {
    List<Widget> playersComponent = [];
    List<Player> playersAux = [];
    playersAux.addAll(players);
    if (playersAux
        .any((player) => player.principalPosition == Position.rightBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.rightBack);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.rightBack,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.defender)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.defender);

        playersComponent.add(PlayerNameAndPositionComponent(
            position: Position.defender,
            playerName: _formatName(player.name!),
            positionColor: teamColor));

        playersAux.remove(player);
      }
    } while (_isAllDefendersSet(playersAux));
    if (playersAux
        .any((player) => player.principalPosition == Position.leftBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.leftBack);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.leftBack,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    return playersComponent;
  }

  List<Widget> _buildForwardsList() {
    List<Widget> playersComponent = [];
    List<Player> playersAux = [];
    playersAux.addAll(players);
    if (playersAux
        .any((player) => player.principalPosition == Position.leftWinger)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.leftWinger);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.leftWinger,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.forward)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.forward);

        playersComponent.add(PlayerNameAndPositionComponent(
            position: Position.forward,
            playerName: _formatName(player.name!),
            positionColor: teamColor));

        playersAux.remove(player);
      }
    } while (_isAllForwardsSet(playersAux));
    if (playersAux
        .any((player) => player.principalPosition == Position.rightWinger)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.rightWinger);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.rightWinger,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    return playersComponent;
  }

  List<Widget> _buildDefendersList() {
    List<Widget> playersComponent = [];
    List<Player> playersAux = [];
    playersAux.addAll(players);
    if (playersAux
        .any((player) => player.principalPosition == Position.leftBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.leftBack);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.leftBack,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.defender)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.defender);

        playersComponent.add(PlayerNameAndPositionComponent(
            position: Position.defender,
            playerName: _formatName(player.name!),
            positionColor: teamColor));

        playersAux.remove(player);
      }
    } while (_isAllDefendersSet(playersAux));
    if (playersAux
        .any((player) => player.principalPosition == Position.rightBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.rightBack);

      playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.rightBack,
          playerName: _formatName(player.name!),
          positionColor: teamColor));

      playersAux.remove(player);
    }
    return playersComponent;
  }

  bool _isAllDefendersSet(List<Player> playersAux) {
    return playersAux
        .any((player) => player.principalPosition == Position.defender);
  }

  List<Widget> _buildMidfielderList() {
    List<Widget> playersComponent = [];
    List<Player> playersAux = [];
    playersAux.addAll(players);
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.midfielder)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.midfielder);

        playersComponent.add(PlayerNameAndPositionComponent(
            position: Position.midfielder,
            playerName: _formatName(player.name!),
            positionColor: teamColor));

        playersAux.remove(player);
      }
    } while (_isAllMidfieldersSet(playersAux));
    return playersComponent;
  }

  bool _isAllMidfieldersSet(List<Player> playersAux) {
    return playersAux
        .any((player) => player.principalPosition == Position.midfielder);
  }

  bool _isAllForwardsSet(List<Player> playersAux) {
    return playersAux
        .any((player) => player.principalPosition == Position.forward);
  }

  String _formatName(String name) {
    if (name.length > 6) {
      return name.substring(0, 6);
    }
    return name;
  }
}
