import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_overall.dart';
import 'package:team_draw/ui/component/horizontal_division_component.dart';
import 'package:team_draw/ui/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_by_position_widget.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_widget.dart';

class TeamLineupSection extends StatefulWidget {
  final Team team;

  const TeamLineupSection({Key? key, required this.team}) : super(key: key);

  @override
  State<TeamLineupSection> createState() => _TeamLineupSectionState();
}

class _TeamLineupSectionState extends State<TeamLineupSection> {
  late TeamOverall teamOverall;

  @override
  void initState() {
    super.initState();
    teamOverall = TeamOverall(widget.team);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamOverallWidget(
                team: widget.team,
                teamOverall: teamOverall.teamOverall,
              ),
              SizedBox(
                child: HorizontalDivisionComponent(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              for (Player player in widget.team.players) ...{
                PlayerOverallItemComponent(player: player)
              },
              SizedBox(
                child: HorizontalDivisionComponent(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              TeamOverallByPositionWidget(
                overallByPosition: teamOverall.overallByPosition,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
