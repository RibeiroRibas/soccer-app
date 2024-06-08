import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/list_item/player_overall_list_item.dart';
import 'package:team_draw/shared/ui/component/player_score_subtitle_component.dart';
import 'package:team_draw/shared/ui/component/player_overall_subtitle_component.dart';

class PlayersPage extends StatelessWidget {
  final List<PlayerScore> playersScore;

  const PlayersPage({super.key, required this.playersScore});

  @override
  Widget build(BuildContext context) {
    final navigator = Modular.get<HomeRouteNavigator>();

    return SingleChildScrollView(
      child: Column(
        children: [
          const PlayerOverallSubtitleComponent(),
          const PlayerScoreSubtitleComponent(),
          if (playersScore.isEmpty)
            NewPlayerAndMatchComponent(
              message: emptyPlayerMessage,
              goToNextRoute: (route) => navigator.goTo('$route/',
                  route == newPlayerRote ? {"player": Player()} : null),
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
                  child: PlayerOverallListItem(
                    playerScore: playersScore[index],
                    player: playersScore[index].player,
                    goToUpdatePlayerRoute: (player) =>
                        navigator.goTo("$newPlayerRote/", {"player": player}),
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
