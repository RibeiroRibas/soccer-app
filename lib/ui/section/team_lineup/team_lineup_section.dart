import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/ui/component/horizontal_division_component.dart';
import 'package:team_draw/ui/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_by_position_widget.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_widget.dart';

class TeamLineupSection extends StatelessWidget {
  final Team team;
  final List<TeamMatch>? allMatches;

  const TeamLineupSection({
    super.key,
    required this.team,
    this.allMatches,
  });

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
                team: team,
                teamOverall: team.teamOverall.value,
              ),
              SizedBox(
                child: HorizontalDivisionComponent(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              for (Player player in team.players!) ...{
                PlayerOverallItemComponent(
                    playerScore: player.calculateScore(allMatches ?? [])),
              },
              SizedBox(
                child: HorizontalDivisionComponent(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              TeamOverallByPositionWidget(
                overallByPosition: team.teamOverall.overallByPosition,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
