import 'package:flutter/material.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class PlayerGoalsListItem extends StatelessWidget {
  final TeamsMatch match;
  final String playerGoalAtTime;
  final bool isOwnGoal;

  const PlayerGoalsListItem({
    super.key,
    required this.match,
    required this.playerGoalAtTime,
    required this.isOwnGoal,
  });

  bool isPLayerTeamOne(String playerName) {
    return match.teamOne!.players!
        .any((player) => playerName.contains(player.name!));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isPLayerTeamOne(playerGoalAtTime) && !isOwnGoal ||
            isPLayerTeamOne(playerGoalAtTime) && isOwnGoal) ...{
          const Expanded(child: SizedBox())
        },
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              CustomIcons.soccerBall,
              size: 20,
              color: isOwnGoal ? ThemeColors.ownGoal : null,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(playerGoalAtTime,
                style: isOwnGoal
                    ? Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ThemeColors.ownGoal)
                    : null)),
        if (isPLayerTeamOne(playerGoalAtTime) && !isOwnGoal ||
            !isPLayerTeamOne(playerGoalAtTime) && isOwnGoal) ...{
          const Expanded(child: SizedBox())
        },
      ],
    );
  }
}
