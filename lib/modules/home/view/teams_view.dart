import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/shared/view/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/box_card_component.dart';
import 'package:team_draw/shared/view/section/subtitle/player_overall_subtitle_section.dart';
import 'package:team_draw/shared/view/section/team_lineup/team_lineup_section.dart';

class TeamsView extends StatelessWidget {
  final List<Team> teams;
  final List<TeamMatch> allMatches;

  const TeamsView({super.key, required this.teams, required this.allMatches});

  @override
  Widget build(BuildContext context) {
    final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();

    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(child: PlayerOverallSubtitleSection()),
        if (teams.isEmpty)
          SliverToBoxAdapter(
            child: NewPlayerAndMatchComponent(
              message: emptyTeamMessage,
              goToNextRoute: (route) => navigator.goTo('$route/', null),
            ),
          ),
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
