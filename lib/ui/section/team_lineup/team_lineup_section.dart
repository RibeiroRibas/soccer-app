import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app_navigator/model/team_overall.dart';
import 'package:team_draw/ui/component/horizontal_division_component.dart';
import 'package:team_draw/ui/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_by_position_widget.dart';
import 'package:team_draw/ui/section/team_lineup/widget/team_overall_widget.dart';

class TeamLineupSection extends StatelessWidget {
  final TeamOverall teamOverall;
  final List<TeamMatch> allMatches;

  const TeamLineupSection({Key? key, required this.teamOverall, required this.allMatches})
      : super(key: key);

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
                team: teamOverall.team,
                teamOverall: teamOverall.teamOverall,
              ),
              SizedBox(
                child: HorizontalDivisionComponent(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              for (Player player in teamOverall.team.players) ...{
                PlayerOverallItemComponent(
                    playerScore: player.calculateScore(allMatches)),
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
