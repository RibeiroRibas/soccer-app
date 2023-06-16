import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app_navigator/model/team_overall.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/subtitle/player_overall_subtitle_section.dart';
import 'package:team_draw/ui/section/team_lineup/team_lineup_section.dart';

class TeamsView extends StatelessWidget {
  final List<TeamOverall> teamsOverall;
  final List<TeamMatch> allMatches;
  const TeamsView({Key? key, required this.teamsOverall, required this.allMatches}) : super(key: key);

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
                    teamOverall: teamsOverall[index],
                    allMatches: allMatches,
                  ),
                ),
              );
            },
            childCount: teamsOverall.length,
          ),
        ),
      ],
    );
  }
}
