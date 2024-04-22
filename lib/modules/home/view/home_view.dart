import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/shared/view/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/section/history_match/history_matches_section.dart';
import 'package:team_draw/shared/view/section/table/classification_table_section.dart';

class HomeView extends StatelessWidget {
  final List<TeamScore> teamsScore;
  final List<TeamMatch> allMatches;

  const HomeView({
    super.key,
    required this.teamsScore,
    required this.allMatches,
  });

  @override
  Widget build(BuildContext context) {
    final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();

    return SingleChildScrollView(
      child: Column(
        children: [
          ClassificationTableSection(teamsScore: teamsScore),
          HistoryMatchesSection(
            teamMatches: allMatches,
          ),
          if (allMatches.isEmpty)
            NewPlayerAndMatchComponent(
              message: emptyMatchMessage,
              goToNextRoute: (route) => navigator.goTo('$route/', null),
            ),
        ],
      ),
    );
  }
}
