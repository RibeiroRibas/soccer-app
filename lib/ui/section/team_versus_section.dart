import 'package:flutter/material.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/team_lineup/team_lineup_section.dart';

class TeamsVersusSection extends StatelessWidget {
  const TeamsVersusSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BoxCardComponent(
                  boxCardBody: TeamLineupSection(team: getTeamOne),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: BoxCardComponent(
                  boxCardBody: TeamLineupSection(team: getTeamFive),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
