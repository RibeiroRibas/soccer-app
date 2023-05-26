import 'package:flutter/material.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/team_versus/widget/change_player_widget.dart';
import 'package:team_draw/ui/section/team_versus/widget/team_lineup_widget.dart';
import 'package:team_draw/data/team_data.dart';

class TeamsVersusSection extends StatelessWidget {
  final bool enablePlayerChange;

  const TeamsVersusSection({
    Key? key,
    required this.enablePlayerChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Team teamOne = getTeamOne;
    final Team teamTwo = getTeamTwo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BoxCardComponent(
              boxCardBody: TeamLineupWidget(
                team: teamOne,
                enablePlayerChange: enablePlayerChange,
              ),
            ),
            if (enablePlayerChange) const ChangePlayerWidget(),
            BoxCardComponent(
              boxCardBody: TeamLineupWidget(
                team: teamTwo,
                enablePlayerChange: enablePlayerChange,
              ),
            ),
          ],
        )
      ],
    );
  }
}