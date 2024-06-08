import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/shared/view/component/player_overall/player_score_widget.dart';
import 'package:team_draw/shared/view/component/player_position_component.dart';

class PlayerOverallItemComponent extends StatelessWidget {
  final PlayerScore? playerScore;
  final Player player;
  final Function(Player)? goToUpdatePlayerRoute;
  final Function(Player)? moveToColumnRight;
  final Function(Player)? moveToColumnLeft;
  final Function(Player)? onSwitchPlayer;

  const PlayerOverallItemComponent(
      {super.key,
      this.playerScore,
      this.goToUpdatePlayerRoute,
      required this.player,
      this.moveToColumnRight,
      this.moveToColumnLeft,
      this.onSwitchPlayer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (moveToColumnLeft != null)
          IconButton(
            onPressed: () => moveToColumnLeft!(player),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
        Expanded(
          child: Text(
            player.name!,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (goToUpdatePlayerRoute != null)
              GestureDetector(
                onTap: () => goToUpdatePlayerRoute!(player),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.edit, size: 25),
                ),
              ),
            if (onSwitchPlayer != null)
              GestureDetector(
                onTap: () => onSwitchPlayer!(player),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.change_circle,
                      size: 20, color: Theme.of(context).primaryColor),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerNameAndPositionComponent(
                position: player.principalPosition,
                positionColor: ThemeColors.principalPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  player.overall!.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 12,
                    color: ThemeColors.overall,
                  ),
                ),
              ),
            ),
            if (playerScore != null)
              Row(
                children: [
                  PlayerScoreWidget(score: playerScore!.goals.toString()),
                  PlayerScoreWidget(score: playerScore!.victories.toString()),
                  PlayerScoreWidget(score: playerScore!.defeats.toString()),
                  PlayerScoreWidget(score: playerScore!.draws.toString()),
                ],
              ),
            if (moveToColumnRight != null)
              IconButton(
                onPressed: () => moveToColumnRight!(player),
                icon: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
