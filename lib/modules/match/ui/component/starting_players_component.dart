import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';

class StartingPlayersComponent extends StatelessWidget {
  final bool isTeamLeftSide;
  final List<Player> players;
  final Color teamColor;
  final bool showEmptyPositions;
  final Function(Player, Player) onSelectedPlayers;
  final int numberOfStartingPlayers;
  final TeamFormation teamFormation;
  final Player? selectedPlayer;

  const StartingPlayersComponent(
      {super.key,
      required this.isTeamLeftSide,
      required this.players,
      required this.teamColor,
      required this.showEmptyPositions,
      required this.onSelectedPlayers,
      required this.numberOfStartingPlayers,
      required this.teamFormation,
      this.selectedPlayer});

  @override
  Widget build(BuildContext context) {
    teamFormation.init();
    return isTeamLeftSide
        ? Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: teamFormation.buildGoalKeeper(),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildDefendersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildDefensiveMidfieldersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.012),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildMidfieldersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.040),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildForwardsLeftSide()),
            ],
          )
        : Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildForwardsRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.040),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildMidfieldersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.012),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildDefensiveMidfieldersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.buildDefendersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: teamFormation.buildGoalKeeper(),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            ],
          );
  }
}
