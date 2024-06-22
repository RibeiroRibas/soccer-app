import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/presentation/custom_icons.dart';

class PlayerGoalsListItem extends StatelessWidget {
  final TeamMatch match;
  final String playerGoalAtTime;

  const PlayerGoalsListItem({
    super.key,
    required this.match,
    required this.playerGoalAtTime,
  });

  bool isPLayerTeamOne(String playerName) {
    return match.teamOne!.players!
        .any((player) => playerName.contains(player.name!));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isPLayerTeamOne(playerGoalAtTime)) ...{
          const Expanded(child: SizedBox())
        },
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(CustomIcons.soccerBall, size: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(playerGoalAtTime),
        ),
        if (isPLayerTeamOne(playerGoalAtTime)) ...{
          const Expanded(child: SizedBox())
        },
      ],
    );
  }
}
