import 'package:flutter/material.dart';
import 'package:team_draw/models/team.dart';
import 'package:team_draw/shared/components/box_card_component.dart';
import 'package:team_draw/shared/sections/team_versus/change_player_widget.dart';
import 'package:team_draw/shared/sections/team_versus/team_lineup_widget.dart';
import 'package:team_draw/data/team_data.dart';

class TeamsVersusSection extends StatelessWidget {
  const TeamsVersusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Team teamOne = getTeamOne;
    final Team teamTwo = getTeamTwo;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BoxCardComponent(
                boxCardBody: TeamLineupWidget(team: teamOne),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const ChangePlayerWidget(),
              BoxCardComponent(
                boxCardBody: TeamLineupWidget(team: teamTwo),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
