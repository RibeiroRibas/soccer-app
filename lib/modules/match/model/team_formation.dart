import 'dart:math';

import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

abstract class TeamFormation {
  final List<Player> players;
  final Color teamColor;
  final Function(Player?) onSelectedPlayers;
  Player? selectedPlayer;
  final Function(Player, Player) selectedPlayers;

  late Player goalKeeper;

  TeamFormation(this.players, this.teamColor, this.onSelectedPlayers,
      this.selectedPlayers);

  void init();

  List<Widget> buildGoalKeeper();

  List<Widget> buildDefensiveMidfieldersLeftSide();

  List<Widget> buildDefensiveMidfieldersRightSide();

  List<Widget> buildDefendersLeftSide();

  List<Widget> buildDefendersRightSide();

  List<Widget> buildMidfieldersLeftSide();

  List<Widget> buildMidfieldersRightSide();

  List<Widget> buildForwardsLeftSide();

  List<Widget> buildForwardsRightSide();

  void addComponent(Player? player, List<Widget> playersComponent);

  String formatName(String name) {
    if (name.length > 6) {
      return name.substring(0, 6);
    }
    return name;
  }

  void setGoalKeeper() {
    if (players.any((player) =>
        player.isGoalKeeper() ||
        player.improvisedPosition == Position.goalkeeper)) {
      return;
    } else {
      int playerIndex = Random().nextInt(players.length);
      players.elementAt(playerIndex).improvisedPosition = Position.goalkeeper;
    }
  }

  Color resolveSelectedPlayerColor(Player playerOrPosition) {
    return selectedPlayer != null &&
                selectedPlayer!.isPresent() &&
                selectedPlayer!.id == playerOrPosition.id ||
            selectedPlayer != null &&
                !selectedPlayer!.isPresent() &&
                selectedPlayer!.principalPosition ==
                    playerOrPosition.principalPosition
        ? ThemeColors.selectedPosition
        : teamColor;
  }

  void setSelectedPlayers(Player player) {
    if (selectedPlayer == null) {
      selectedPlayer = player;
      onSelectedPlayers(player);
    } else if (selectedPlayer!.id == player.id) {
      selectedPlayer = null;
      onSelectedPlayers(null);
    } else {
      selectedPlayers(selectedPlayer!, player);
      selectedPlayer = null;
    }
  }
}
