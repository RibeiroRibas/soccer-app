import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/team_name_and_shield_widget.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/teams_information_widget.dart';
import 'package:team_draw/modules/new_match/view_model/draw_teams_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/section/team_lineup/team_lineup_section.dart';

class DrawnTeamsView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const DrawnTeamsView(
      {super.key, required this.selectedPlayers, required this.matchSettings});

  @override
  State<DrawnTeamsView> createState() => _DrawnTeamsViewState();
}

class _DrawnTeamsViewState extends State<DrawnTeamsView> {
  final DrawTeamsViewModel controller = Modular.get<DrawTeamsViewModel>();

  @override
  void initState() {
    super.initState();
  }

  void _sortTeams() {
    controller.sortTeamsMatch(widget.selectedPlayers, widget.matchSettings);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: ElevatedButtonComponent(
              onButtonPressed: () => _sortTeams(),
              text: sortTeams,
            ),
          ),
        ),
        Observer(
          builder: (_) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TeamNameAndShieldWidget(
                            team: controller.teamMatches
                                .elementAt(index)
                                .teamOne!,
                            onChange: (oldNameOrShield, newNameOrShield) {
                              controller.onTeamNameOrShieldChange(
                                  oldNameOrShield, newNameOrShield);
                            }),
                        const Text(versus),
                        TeamNameAndShieldWidget(
                            team: controller.teamMatches
                                .elementAt(index)
                                .teamTwo!,
                            onChange: (oldNameOrShield, newNameOrShield) {
                              controller.onTeamNameOrShieldChange(
                                  oldNameOrShield, newNameOrShield);
                            }),
                      ],
                    ),
                    BoxCardComponent(
                      boxCardBody: TeamsInformationWidget(
                        teamsInformation:
                            controller.teamsInformation.elementAt(index),
                      ),
                    ),
                  ],
                );
              },
              childCount: controller.teamMatches.length,
            ),
          ),
        ),
        Observer(
          builder: (_) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: BoxCardComponent(
                    boxCardBody: TeamLineupSection(
                      team: controller.sortedTeams[index],
                    ),
                  ),
                );
              },
              childCount: controller.sortedTeams.length,
            ),
          ),
        ),
      ],
    );
  }
}
