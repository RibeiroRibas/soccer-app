import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class PlayerInfoListItem extends StatelessWidget {
  final PlayerScore? playerScore;
  final Player player;
  final Function(Player)? onSwitchPlayer;
  final Function(Player)? goToUpdatePlayerRoute;
  final Function(Player)? onDeletePlayerTap;

  const PlayerInfoListItem(
      {super.key,
      this.playerScore,
      required this.player,
      this.onSwitchPlayer,
      this.goToUpdatePlayerRoute,
      this.onDeletePlayerTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
            if (onDeletePlayerTap != null)
              GestureDetector(
                onTap: () => onDeletePlayerTap!(player),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.delete, size: 25),
                ),
              ),
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
                  _PlayerScoreWidget(score: playerScore!.goals.toString()),
                  _PlayerScoreWidget(score: playerScore!.victories.toString()),
                  _PlayerScoreWidget(score: playerScore!.defeats.toString()),
                  _PlayerScoreWidget(score: playerScore!.draws.toString()),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class _PlayerScoreWidget extends StatelessWidget {
  final String score;

  const _PlayerScoreWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 29,
      alignment: Alignment.center,
      child: Text(score, textAlign: TextAlign.center),
    );
  }
}
