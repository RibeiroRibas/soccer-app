import 'package:flutter/material.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/model/team_shield.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/modules/new_match/ui/components/team_name_and_shield_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/teams_info_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class TeamVersusListItem extends StatelessWidget {
  final TeamsMatch teamMatch;
  final Function(String, String) onTeamNameChange;
  final Function(TeamShield, TeamShield) onTeamShieldChange;
  final List<String> availableNames;
  final TeamInformation teamInformation;

  const TeamVersusListItem(
      {super.key,
      required this.teamMatch,
      required this.onTeamNameChange,
      required this.availableNames,
      required this.onTeamShieldChange,
      required this.teamInformation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: Column(
            children: [
              TextWithBorderComponent(
                  text: tapOnShieldOrNameToEdit,
                  textStyle: Theme.of(context).textTheme.bodyMedium!),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TeamNameAndShieldComponent(
                      team: teamMatch.teamOne!,
                      onTeamNameChange: onTeamNameChange,
                      availableNames: availableNames,
                      onChangeTeamShield: onTeamShieldChange),
                  const Text(versus),
                  TeamNameAndShieldComponent(
                      team: teamMatch.teamTwo!,
                      onTeamNameChange: onTeamNameChange,
                      availableNames: availableNames,
                      onChangeTeamShield: onTeamShieldChange),
                ],
              ),
            ],
          ),
        ),
        BoxCardComponent(
            boxCardBody:
                TeamsInformationComponent(teamsInformation: teamInformation)),
      ],
    );
  }
}
