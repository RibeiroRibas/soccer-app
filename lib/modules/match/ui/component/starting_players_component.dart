import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';

class StartingPlayersComponent extends StatelessWidget {
  final bool isTeamLeftSide;
  final TeamFormation teamFormation;
  final Player? selectedPlayer;

  const StartingPlayersComponent(
      {super.key,
      required this.isTeamLeftSide,
      required this.teamFormation,
      required this.selectedPlayer});

  @override
  Widget build(BuildContext context) {
    teamFormation.init(selectedPlayer);
    return isTeamLeftSide
        ? Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: teamFormation.getGoalKeeper(),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getDefendersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getDefensiveMidfieldersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.012),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getMidfieldersLeftSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.040),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getForwardsLeftSide()),
            ],
          )
        : Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getForwardsRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.040),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getMidfieldersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.012),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getDefensiveMidfieldersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: teamFormation.getDefendersRightSide()),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: teamFormation.getGoalKeeper(),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            ],
          );
  }
}
