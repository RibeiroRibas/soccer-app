import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/team_name_and_shield_widget.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/teams_information_widget.dart';
import 'package:team_draw/modules/new_match/view_model/draw_teams_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/box_card_component.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';
import 'package:team_draw/shared/view/section/team_lineup/team_lineup_section.dart';

class DrawnTeamsView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const DrawnTeamsView(
      {super.key,
      required this.selectedPlayers,
      required this.matchSettings,
      required this.onShowForwardButton});

  @override
  State<DrawnTeamsView> createState() => _DrawnTeamsViewState();
}

class _DrawnTeamsViewState extends State<DrawnTeamsView> {
  final DrawTeamsViewModel controller = Modular.get<DrawTeamsViewModel>();

  @override
  void initState() {
    super.initState();
    if (controller.teamMatches.isEmpty) {
      widget.onShowForwardButton(false);
    }
  }

  void _sortTeams() {
    controller.sortTeamsMatch(widget.selectedPlayers, widget.matchSettings);
    widget.onShowForwardButton.call(true);
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
                    Container(
                      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: [
                          TextWithBorderComponent(
                            text: tapOnShieldOrNameToEdit,
                            textStyle: Theme.of(context).textTheme.bodyMedium!,
                          ),
                          const SizedBox(height: 4),
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
                                  },
                                  availableNames: controller.availableNames),
                              const Text(versus),
                              TeamNameAndShieldWidget(
                                team: controller.teamMatches
                                    .elementAt(index)
                                    .teamTwo!,
                                onChange: (oldNameOrShield, newNameOrShield) {
                                  controller.onTeamNameOrShieldChange(
                                      oldNameOrShield, newNameOrShield);
                                },
                                availableNames: controller.availableNames,
                              ),
                            ],
                          ),
                        ],
                      ),
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
