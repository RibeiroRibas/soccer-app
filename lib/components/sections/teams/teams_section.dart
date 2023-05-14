import 'package:flutter/material.dart';
import 'package:team_draw/components/box_card.dart';
import 'package:team_draw/components/section_tittle.dart';
import 'package:team_draw/components/sections/teams/change_player.dart';
import 'package:team_draw/components/sections/teams/team_lineup.dart';
import 'package:team_draw/models/team.dart';
import 'package:team_draw/teams_data.dart';

class TeamsSection extends StatelessWidget {
  const TeamsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Team teamOne = getTeamOne;
    final Team teamTwo = getTeamTwo;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SectionTittle(
            tittle: "Times",
            icon: Icons.people,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BoxCard(
                boxCardBody: TeamLineup(team: teamOne),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const ChangePlayer(),
              BoxCard(
                boxCardBody: TeamLineup(team: teamTwo),
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
