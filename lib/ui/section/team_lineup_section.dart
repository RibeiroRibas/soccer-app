import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/ui/section/team_versus/widget/positions_and_overall_widget.dart';
import 'package:team_draw/ui/section/team_versus/widget/team_overall_widget.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class TeamLineupSection extends StatefulWidget {
  final Team team;
  final double cardWidth;

  const TeamLineupSection({
    Key? key,
    required this.team,
    required this.cardWidth,
  }) : super(key: key);

  @override
  State<TeamLineupSection> createState() => _TeamLineupSectionState();
}

class _TeamLineupSectionState extends State<TeamLineupSection> {

  late Map<Map<Position, double>, double> teamOverall;

  @override
  void initState() {
    super.initState();
    teamOverall = widget.team.hasPlayerBackup()
        ? widget.team.getTeamOverallWithPlayerBackup
        : widget.team.getTeamOverall;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.cardWidth,
      child: Column(
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
            child: ListView.builder(
              itemBuilder: (context, index) {
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
                    PositionsAndOverallWidget(
                        player: widget.team.players[index])
                  ],
                );
              },
              itemCount: widget.team.players.length,
              physics: const ScrollPhysics(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              teamOverall.values.elementAt(0).toInt().toString(),
              textAlign: TextAlign.end,
              style: TextStyle(
                color: greenTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TeamOverallWidget(
            overallByPosition: teamOverall.keys.elementAt(0),
            cardWidth: widget.cardWidth,
          ),
        ],
      ),
    );
  }
}