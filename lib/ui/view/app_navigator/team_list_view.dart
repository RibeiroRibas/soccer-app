import 'package:flutter/cupertino.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/team_lineup/team_lineup_section.dart';

import '../../section/subtitle/subtitle_section.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Team> teams = getAllTeams;

    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SubtitleSection(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: BoxCardComponent(
                    boxCardBody: TeamLineupSection(team: teams[index]),
                  ),
                );
              },
              childCount: teams.length,
            ),
          ),
        ],
      ),
    );
  }
}
