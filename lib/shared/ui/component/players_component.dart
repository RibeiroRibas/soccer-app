import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/player_score_icons_component.dart';
import 'package:team_draw/shared/ui/list_item/player_info_list_item_.dart';
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
    return playersScore.isEmpty
        ? NewPlayerAndMatchComponent(
            message: emptyPlayerMessage,
            goToNextRoute: goToNextRoute,
            isShowNewMatchButton: false,
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                const PlayerScoreIconsComponent(),
                const SizedBox(height: 8.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PlayerInfoListItem(
                          playerScore: playersScore.elementAt(index),
                          player: playersScore.elementAt(index).player,
                          goToUpdatePlayerRoute: goToUpdatePlayerRoute,
                        ),
                        const SizedBox(height: 4.0),
                        const Divider(),
                        const SizedBox(height: 4.0),
                      ],
                    );
                  },
                  itemCount: playersScore.length,
                ),
              ],
            ),
          );
  }
}
