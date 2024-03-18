import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/subtitle/player_overall_subtitle_section.dart';
import 'package:team_draw/ui/section/team_lineup/team_lineup_section.dart';

class TeamsView extends StatelessWidget {
  final List<Team> teams;
  final List<TeamMatch> allMatches;

  const TeamsView({super.key, required this.teams, required this.allMatches});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(child: PlayerOverallSubtitleSection()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: BoxCardComponent(
                  boxCardBody: TeamLineupSection(
                    team: teams[index],
                    allMatches: allMatches,
                  ),
                ),
              );
            },
            childCount: teams.length,
          ),
        ),
      ],
    );
  }
}
