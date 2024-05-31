import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/extensions/player_goals_extension.dart';
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
    List<String> playersGoalAtTime = teamMatch.matchGoals != null
        ? teamMatch.matchGoals!.getPlayerGoalAtTime()
        : [];

    bool isPLayerTeamOne(String playerName) {
      return teamMatch.teamOne!.players!
          .any((player) => playerName.contains(player.name!));
    }

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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      if (!isPLayerTeamOne(playersGoalAtTime[index])) ...{
                        const Expanded(child: SizedBox())
                      },
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(CustomIcons.soccerBall, size: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(playersGoalAtTime.elementAt(index)),
                      ),
                      if (isPLayerTeamOne(playersGoalAtTime[index])) ...{
                        const Expanded(child: SizedBox())
                      },
                    ],
                  );
                },
                itemCount: playersGoalAtTime.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
