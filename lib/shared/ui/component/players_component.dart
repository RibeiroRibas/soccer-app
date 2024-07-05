import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/player_overall_subtitle_component.dart';
import 'package:team_draw/shared/ui/component/player_score_subtitle_component.dart';
import 'package:team_draw/shared/ui/list_item/player_overall_list_item.dart';

class PlayersComponent extends StatelessWidget {
  final List<PlayerScore> playersScore;
  final Function(String) goToNextRoute;
  final Function(Player) goToUpdatePlayerRoute;

  const PlayersComponent(
      {super.key,
      required this.playersScore,
      required this.goToNextRoute,
      required this.goToUpdatePlayerRoute});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PlayerOverallSubtitleComponent(),
          const PlayerScoreSubtitleComponent(),
          if (playersScore.isEmpty)
            NewPlayerAndMatchComponent(
              message: emptyPlayerMessage,
              goToNextRoute: goToNextRoute,
              isShowNewMatchButton: false,
            ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: PlayerOverallListItem(
                  playerScore: playersScore.elementAt(index),
                  player: playersScore.elementAt(index).player,
                  goToUpdatePlayerRoute: goToUpdatePlayerRoute,
                ),
              );
            },
            itemCount: playersScore.length,
          ),
        ],
      ),
    );
  }
}
