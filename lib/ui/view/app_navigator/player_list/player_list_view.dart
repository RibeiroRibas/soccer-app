import 'package:flutter/material.dart';
import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/ui/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/ui/section/subtitle/player_overall_subtitle_section.dart';
import 'package:team_draw/ui/view/app_navigator/player_list/player_score_subtitle_widget.dart';

class PlayerListView extends StatefulWidget {
  const PlayerListView({Key? key}) : super(key: key);

  @override
  State<PlayerListView> createState() => _PlayerListViewState();
}

class _PlayerListViewState extends State<PlayerListView> {
  final List<Player> players = playersList;
  final List<TeamMatch> matches = getAllMatches;

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
                    player: players[index],
                    showPlayerScore: true,
                    matches: matches,
                  ),
                );
              },
              itemCount: players.length,
            ),
          ),
        ],
      ),
    );
  }
}
