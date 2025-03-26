import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/team_lineup_component.dart';

class TeamsPageView extends StatelessWidget {
  final List<Team> teams;

  const TeamsPageView({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    final HomeRouteNavigator navigator = Modular.get<HomeRouteNavigator>();

    return SingleChildScrollView(
        child: Column(
      children: [
        if (teams.isEmpty)
          NewPlayerAndMatchComponent(
              message: emptyTeamMessage,
              goToNewPlayerRoute: (route) =>
                  navigator.goTo('$route/', arguments: {"player": Player()}),
              goToNewMatchRoute: (route) => navigator.goTo('$route/')),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  BoxCardComponent(
                      boxCardBody: TeamLineupComponent(team: teams[index])),
                  const SizedBox(height: 8.0),
                ],
              );
            },
            itemCount: teams.length),
      ],
    ));
  }
}
