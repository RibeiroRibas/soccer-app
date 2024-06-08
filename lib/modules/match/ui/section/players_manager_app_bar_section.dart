import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/team_shield_and_name_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class PlayersManagerAppBarSection extends StatelessWidget {
  final String teamName;
  final String teamShield;
  final Function onChangeTeamTap;

  const PlayersManagerAppBarSection(
      {super.key,
      required this.teamName,
      required this.teamShield,
      required this.onChangeTeamTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TeamShieldAndNameComponent(
                teamName: teamName, teamShield: teamShield)),
        TextWithBorderComponent(
            text: playersManager,
            textStyle: Theme.of(context).textTheme.bodyLarge!),
        SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: IconButton(
                onPressed: () => onChangeTeamTap.call(),
                icon: Icon(Icons.change_circle,
                    size: 50, color: Theme.of(context).primaryColor))),
      ],
    );
  }
}
