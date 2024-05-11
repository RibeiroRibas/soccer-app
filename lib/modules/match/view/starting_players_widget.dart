import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/view/component/player_position_component.dart';

class StartingPlayersWidget extends StatelessWidget {
  final bool isTeamLeftSide;
  final List<Player> players;
  final Color teamColor;

  const StartingPlayersWidget(
      {super.key,
      required this.isTeamLeftSide,
      required this.players,
      required this.teamColor});

  @override
  Widget build(BuildContext context) {
    return isTeamLeftSide
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerNameAndPositionComponent(
                      position: players.first.principalPosition,
                      playerName: players.first.name,
                      positionColor: teamColor,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildDefendersList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildMidfielderList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildForwardsList(),
                ),
              ],
            ),
          )
        : Positioned(
            right: 0.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildForwardsList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildMidfielderList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildDefendersListRightSide(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayerNameAndPositionComponent(
                        position: players.first.principalPosition,
                        playerName: players.first.name,
                        positionColor: teamColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
        playerName: player.name,
        positionColor: teamColor,
      ));

      playersAux.remove(player);
    }
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.defender)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.defender);

        playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.defender,
          playerName: player.name,
          positionColor: teamColor,
        ));

        playersAux.remove(player);
      }
    } while (_isAllDefendersSet(playersAux));
    if (playersAux
        .any((player) => player.principalPosition == Position.leftBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.leftBack);

      playersComponent.add(PlayerNameAndPositionComponent(
        position: Position.leftBack,
        playerName: player.name,
        positionColor: teamColor,
      ));

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
        playerName: player.name,
        positionColor: teamColor,
      ));

      playersAux.remove(player);
    }
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.defender)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.defender);

        playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.defender,
          playerName: player.name,
          positionColor: teamColor,
        ));

        playersAux.remove(player);
      }
    } while (_isAllDefendersSet(playersAux));
    if (playersAux
        .any((player) => player.principalPosition == Position.rightBack)) {
      Player player = playersAux.firstWhere(
          (player) => player.principalPosition == Position.rightBack);

      playersComponent.add(PlayerNameAndPositionComponent(
        position: Position.rightBack,
        playerName: player.name,
        positionColor: teamColor,
      ));

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
          playerName: player.name,
          positionColor: teamColor,
        ));

        playersAux.remove(player);
      }
    } while (_isAllMidfieldersSet(playersAux));
    return playersComponent;
  }

  bool _isAllMidfieldersSet(List<Player> playersAux) {
    return playersAux
        .any((player) => player.principalPosition == Position.midfielder);
  }

  List<Widget> _buildForwardsList() {
    List<Widget> playersComponent = [];
    List<Player> playersAux = [];
    playersAux.addAll(players);
    do {
      if (playersAux
          .any((player) => player.principalPosition == Position.forward)) {
        Player player = playersAux.firstWhere(
            (player) => player.principalPosition == Position.forward);

        playersComponent.add(PlayerNameAndPositionComponent(
          position: Position.forward,
          playerName: player.name,
          positionColor: teamColor,
        ));

        playersAux.remove(player);
      }
    } while (_isAllForwardsSet(playersAux));
    return playersComponent;
  }

  bool _isAllForwardsSet(List<Player> playersAux) {
    return playersAux
        .any((player) => player.principalPosition == Position.forward);
  }
}
