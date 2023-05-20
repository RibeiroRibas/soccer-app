import 'package:flutter/material.dart';
import 'package:team_draw/models/position.dart';
import 'package:team_draw/models/team.dart';
import 'package:team_draw/shared/sections/team_versus/positions_and_overrall_widget.dart';
import 'package:team_draw/shared/sections/team_versus/team_overall_widget.dart';
import 'package:team_draw/shared/themes/green_theme.dart';

class TeamLineupWidget extends StatefulWidget {
  const TeamLineupWidget({Key? key, required this.team}) : super(key: key);
  final Team team;

  @override
  State<TeamLineupWidget> createState() => _TeamLineupWidgetState();
}

class _TeamLineupWidgetState extends State<TeamLineupWidget> {
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
                style: greenTheme.textTheme.displaySmall,
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
                PositionsAndOverallWidget(player: widget.team.players[index])
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
        TeamOverallWidget(overallByPosition: teamOverall.keys.elementAt(0)),
      ],
    );
  }
}
