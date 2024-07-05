import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_details.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_and_arrows_component.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';
import 'package:team_draw/shared/ui/component/match_score_component.dart';
import 'package:team_draw/shared/ui/component/team_lineup_component.dart';
import 'package:team_draw/shared/ui/component/teams_info_component.dart';

class StartDejaVuMatchPage extends StatelessWidget {
  final MatchDetails matchesDetail;

  const StartDejaVuMatchPage({super.key, required this.matchesDetail});

  @override
  Widget build(BuildContext context) {
    final navigator = Modular.get<NewMatchRoteNavigator>();

    return Scaffold(
      appBar: AppBarTittleAndArrowsComponent(
        tittle: matchRepeater,
        onBackAction: () => navigator.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonComponent(
                  onButtonPressed: () {
                    matchesDetail.resetResults();
                    navigator.goTo("$matchRote/", arguments: {
                      "matches": matchesDetail.matches,
                      "matchSettings": matchesDetail.matchSettings
                    });
                  },
                  text: startMatch,
                ),
              ),
              for (TeamMatch match in matchesDetail.matches) ...{
                const SizedBox(height: 25),
                MatchScoreComponent(match: match),
                TeamsInformationComponent(
                    teamsInformation: match.getTeamsInformation()),
              },
              const SizedBox(height: 25),
              for (Team team in matchesDetail.getTeams()) ...{
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: BoxCardComponent(
                    boxCardBody: TeamLineupComponent(team: team),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
