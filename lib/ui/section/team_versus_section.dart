import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/ui/component/box_card_component.dart';

import 'team_lineup/team_lineup_section.dart';

class TeamsVersusSection extends StatelessWidget {
  final TeamMatch teamsMatch;
  const TeamsVersusSection({
    super.key,
    required this.teamsMatch,
  });

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
                  boxCardBody: TeamLineupSection(team: teamsMatch.teamOne!),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: BoxCardComponent(
                  boxCardBody: TeamLineupSection(team: teamsMatch.teamTwo!),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
