import 'package:flutter/material.dart';
import 'package:team_draw/components/player_position.dart';
import 'package:team_draw/components/sections/teams/team_overall.dart';
import 'package:team_draw/models/player.dart';
import 'package:team_draw/models/position.dart';
import 'package:team_draw/models/team.dart';
import 'package:team_draw/themes/green_theme.dart';
import 'package:team_draw/themes/theme_colors.dart';

class TeamLineup extends StatefulWidget {
  const TeamLineup({Key? key, required this.team}) : super(key: key);
  final Team team;

  @override
  State<TeamLineup> createState() => _TeamLineupState();
}

class _TeamLineupState extends State<TeamLineup> {
  @override
  Widget build(BuildContext context) {
    Map<Map<Position, double>, double> teamOverall = widget.team.getTeamOverall;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage(widget.team.shield),
                height: 35,
              ),
            ),
            Expanded(
              child: Text(
                widget.team.name,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(itemBuilder: (context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.team.players[index].name,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                PositionsAndOverall(player: widget.team.players[index])
              ],
            );
          },itemCount: widget.team.players.length,),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            teamOverall.values.elementAt(0).toInt().toString(),
            textAlign: TextAlign.end,
            style: TextStyle(color: greenTheme.primaryColor,fontWeight: FontWeight.bold),
          ),
        ),
        TeamOverallByPosition(overallByPosition: teamOverall.keys.elementAt(0)),
      ],
    );
  }
}

class PositionsAndOverall extends StatefulWidget {
  const PositionsAndOverall({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  State<PositionsAndOverall> createState() => _PositionsAndOverallState();
}

class _PositionsAndOverallState extends State<PositionsAndOverall> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayerPosition(
          position: widget.player.principalPosition,
          positionColor: ThemeColors.principalPosition,
        ),
        PlayerPosition(
          position: widget.player.secondaryPosition,
          positionColor: ThemeColors.secondaryPosition,
        ),
        PlayerPosition(
          position: widget.player.tertiaryPosition,
          positionColor: ThemeColors.tertiaryPosition,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 15,
            height: 15,
            alignment: Alignment.center,
            child: Text(
              widget.player.overall.toInt().toString(),
              style: TextStyle(
                fontSize: 12,
                color: greenTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
