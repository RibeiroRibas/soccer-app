import 'package:flutter/material.dart';
import 'package:team_draw/modules/app_navigator/model/player_score.dart';
import 'package:team_draw/ui/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/ui/section/subtitle/player_overall_subtitle_section.dart';

import 'player_score_subtitle_widget.dart';

class PlayersView extends StatelessWidget {
  final List<PlayerScore> playersScore;
  const PlayersView({Key? key, required this.playersScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const PlayerOverallSubtitleSection(),
          const PlayerScoreSubtitleWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: PlayerOverallItemComponent(
                    playerScore: playersScore[index],
                    showPlayerScore: true
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
