import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/team_shield_and_name_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class PlayersManagerAppBarComponent extends StatelessWidget {
  final String teamName;
  final String teamShield;

  const PlayersManagerAppBarComponent(
      {super.key, required this.teamName, required this.teamShield});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TeamShieldAndNameComponent(
                teamName: teamName, teamShield: teamShield)),
        const Expanded(child: SizedBox()),
        TextWithBorderComponent(
            text: playersManager,
            textStyle: Theme.of(context).textTheme.bodyLarge!),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
