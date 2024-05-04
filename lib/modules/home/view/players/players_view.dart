import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/view/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/shared/view/section/subtitle/player_overall_subtitle_section.dart';

import 'player_score_subtitle_widget.dart';

class PlayersView extends StatelessWidget {
  final List<PlayerScore> playersScore;
  final Function(String) goToNextRoute;
  final Function(Player) goToUpdatePlayerRoute;

  const PlayersView({
    super.key,
    required this.playersScore,
    required this.goToNextRoute,
    required this.goToUpdatePlayerRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PlayerOverallSubtitleSection(),
          const PlayerScoreSubtitleWidget(),
          if (playersScore.isEmpty)
            NewPlayerAndMatchComponent(
              message: emptyPlayerMessage,
              goToNextRoute: (route) => goToNextRoute(route),
              isShowNewMatchButton: false,
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: PlayerOverallItemComponent(
                    playerScore: playersScore[index],
                    showPlayerScore: true,
                    goToUpdatePlayerRoute: goToUpdatePlayerRoute,
                  ),
                );
              },
              itemCount: playersScore.length,
            ),
          ),
        ],
      ),
    );
  }
}
