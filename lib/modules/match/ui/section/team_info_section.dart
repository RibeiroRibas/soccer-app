import 'package:flutter/material.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/home/view/players/player_score_subtitle_widget.dart';
import 'package:team_draw/shared/view/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/shared/view/section/team_lineup/widget/team_overall_widget.dart';

class TeamInfoSection extends StatelessWidget {
  final List<PlayerScore> playersScore;
  final Team team;

  const TeamInfoSection(
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
              TeamOverallWidget(
                  team: team, teamOverall: team.teamOverall.value),
              const PlayerScoreSubtitleWidget(),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallItemComponent(
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
