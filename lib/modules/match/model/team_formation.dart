import 'dart:math';

import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

abstract class TeamFormation {
  final List<Player> players;
  final Color teamColor;
  final Function(Player) onSelectedPlayer;
  final Function(Player) onLongPlayerPress;
  Player? selectedPlayer;
  Position? selectedPosition;

  late Player goalKeeper;

  TeamFormation(this.players, this.teamColor, this.onSelectedPlayer,
      this.onLongPlayerPress);

  void init(Player? selectedPlayer);

  List<Widget> getGoalKeeper();

  List<Widget> getDefensiveMidfieldersLeftSide();

  List<Widget> getDefensiveMidfieldersRightSide();

  List<Widget> getDefendersLeftSide();

  List<Widget> getDefendersRightSide();

  List<Widget> getMidfieldersLeftSide();

  List<Widget> getMidfieldersRightSide();

  List<Widget> getForwardsLeftSide();

  List<Widget> getForwardsRightSide();

  void addComponent(Player player, List<Widget> playersComponent);

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

  Color resolveSelectedPlayerOrPositionColor(Player player) {
      return selectedPlayer != null && selectedPlayer!.id == player.id ||
          selectedPlayer != null &&
              selectedPlayer!.principalPosition == player.principalPosition
          ? ThemeColors.selectedPosition
          : teamColor;
  }
}
