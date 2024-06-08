import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/shared/ui/list_item/player_overall_list_item.dart';
import 'package:team_draw/shared/ui/component/team_overall_by_position_component.dart';
import 'package:team_draw/shared/ui/component/team_overall_component.dart';

class TeamLineupComponent extends StatelessWidget {
  final Team team;
  final List<TeamMatch>? allMatches;
  final Function(Player)? onSwitchPlayer;

  const TeamLineupComponent(
      {super.key, required this.team, this.allMatches, this.onSwitchPlayer});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamOverallComponent(
                team: team,
                teamOverall: team.teamOverall.value,
              ),
              const Divider(),
              for (Player player in team.players!) ...{
                PlayerOverallListItem(
                  playerScore: allMatches != null
                      ? player.calculateScore(allMatches!)
                      : null,
                  player: player,
                  onSwitchPlayer: onSwitchPlayer,
                ),
              },
              const Divider(),
              TeamOverallByPositionComponent(
                overallByPosition: team.teamOverall.overallByPosition,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
