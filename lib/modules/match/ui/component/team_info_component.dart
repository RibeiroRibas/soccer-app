import 'package:flutter/material.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/shared/ui/component/player_score_subtitle_component.dart';
import 'package:team_draw/shared/ui/list_item/player_overall_list_item.dart';
import 'package:team_draw/shared/ui/component/team_overall_component.dart';

class TeamInfoComponent extends StatelessWidget {
  final List<PlayerScore> playersScore;
  final Team team;

  const TeamInfoComponent(
      {super.key, required this.playersScore, required this.team});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 5.0,
            spacing: 30.0,
            children: [
              TeamOverallComponent(
                  team: team, teamOverall: team.teamOverall.value),
              const PlayerScoreSubtitleComponent(),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallListItem(
                        playerScore: playersScore[index],
                        player: playersScore[index].player);
                  },
                  itemCount: playersScore.length),
            ],
          ),
        ),
      ),
    );
  }
}
