import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/teams_info_component.dart';
import 'package:team_draw/shared/view/component/box_card_component.dart';

class MatchInfoSection extends StatelessWidget {
  final TeamMatch teamMatch;
  final TeamInformation teamInformation;

  const MatchInfoSection(
      {super.key, required this.teamMatch, required this.teamInformation});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 5.0,
            spacing: 30.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(teamMatch.scoreTeamOne.toString(),
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(versus, style: Theme.of(context).textTheme.titleLarge),
                  Text(teamMatch.scoreTeamTwo.toString(),
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 20),
              BoxCardComponent(
                  boxCardBody: TeamsInformationComponent(
                      teamsInformation: teamInformation)),
            ],
          ),
        ),
      ),
    );
  }
}
