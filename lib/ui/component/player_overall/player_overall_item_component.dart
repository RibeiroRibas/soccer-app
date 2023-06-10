import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/ui/component/player_overall/player_score_widget.dart';
import 'package:team_draw/ui/component/player_position_component.dart';

import '../../../model/player.dart';
import '../../../shared/theme/green_theme.dart';
import '../../../shared/theme/theme_colors.dart';

class PlayerOverallItemComponent extends StatefulWidget {
  final Player player;
  final bool showPlayerScore;
  final List<TeamMatch> matches;

  const PlayerOverallItemComponent({
    Key? key,
    required this.player,
    this.showPlayerScore = false,
    this.matches = const [],
  }) : super(key: key);

  @override
  State<PlayerOverallItemComponent> createState() =>
      _PlayerOverallItemComponentState();
}

class _PlayerOverallItemComponentState
    extends State<PlayerOverallItemComponent> {
  late PlayerScore playerScore;

  @override
  void initState() {
    super.initState();
    if (widget.showPlayerScore) {
      playerScore = PlayerScore(widget.matches, widget.player);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.player.name,
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
                position: widget.player.principalPosition,
                positionColor: ThemeColors.principalPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerPositionComponent(
                position: widget.player.secondaryPosition,
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
                  widget.player.overall.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 12,
                    color: greenTheme.primaryColor,
                  ),
                ),
              ),
            ),
            if (widget.showPlayerScore)
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
