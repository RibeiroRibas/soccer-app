import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/tittle_section.dart';

import 'widget/all_matches_widget.dart';

class HistoryMatchesSection extends StatelessWidget {
  final List <TeamMatch> teamMatches;
  const HistoryMatchesSection({Key? key, required this.teamMatches,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(top: 16.0, bottom: 8.0, left: 4.0, right: 8.0),
            child: TittleSection(tittle: historyMatches)
          ),
          BoxCardComponent(
            boxCardBody: AllMatchesWidget(teamMatches: teamMatches,),
          ),
        ],
    );
  }
}
