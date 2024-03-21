import 'package:flutter/cupertino.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/component/player_overall/player_score_widget.dart';
import 'package:team_draw/ui/component/player_position_component.dart';

class PlayerOverallItemComponent extends StatelessWidget {
  final PlayerScore playerScore;
  final bool showPlayerScore;

  const PlayerOverallItemComponent({
    super.key,
    required this.playerScore,
    this.showPlayerScore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            playerScore.player.name!,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerPositionComponent(
                position: playerScore.player.principalPosition,
                positionColor: ThemeColors.principalPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerPositionComponent(
                position: playerScore.player.secondaryPosition,
                positionColor: ThemeColors.secondaryPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  playerScore.player.overall!.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 12,
                    color: greenTheme.primaryColor,
                  ),
                ),
              ),
            ),
            if (showPlayerScore)
              Row(
                children: [
                  PlayerScoreWidget(score: playerScore.goals.toString()),
                  PlayerScoreWidget(score: playerScore.victories.toString()),
                  PlayerScoreWidget(score: playerScore.defeats.toString()),
                  PlayerScoreWidget(score: playerScore.draws.toString()),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
