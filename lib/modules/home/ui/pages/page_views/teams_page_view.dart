import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/player_overall_subtitle_component.dart';
import 'package:team_draw/shared/ui/component/team_lineup_component.dart';

class TeamsPageView extends StatelessWidget {
  final List<Team> teams;

  const TeamsPageView({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    final HomeRouteNavigator navigator = Modular.get<HomeRouteNavigator>();

    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(child: PlayerOverallSubtitleComponent()),
        if (teams.isEmpty)
          SliverToBoxAdapter(
            child: NewPlayerAndMatchComponent(
              message: emptyTeamMessage,
              goToNextRoute: (route) => navigator.goTo('$route/'),
            ),
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: BoxCardComponent(
                  boxCardBody: TeamLineupComponent(team: teams[index]),
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
