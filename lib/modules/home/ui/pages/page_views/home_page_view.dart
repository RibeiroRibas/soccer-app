import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/modules/home/ui/components/history_matches_component.dart';
import 'package:team_draw/modules/home/ui/components/classification_table_component.dart';

class HomePageView extends StatelessWidget {
  final List<TeamScore> teamsScore;
  final List<TeamMatch> allMatches;

  const HomePageView({
    super.key,
    required this.teamsScore,
    required this.allMatches,
  });

  @override
  Widget build(BuildContext context) {
    final HomeRouteNavigator navigator = Modular.get<HomeRouteNavigator>();

    return SingleChildScrollView(
      child: Column(
        children: [
          ClassificationTableComponent(teamsScore: teamsScore),
          HistoryMatchesComponent(
            teamMatches: allMatches,
          ),
          if (allMatches.isEmpty)
            NewPlayerAndMatchComponent(
              message: emptyMatchMessage,
              goToNextRoute: (route) => navigator.goTo('$route/'),
            ),
        ],
      ),
    );
  }
}
