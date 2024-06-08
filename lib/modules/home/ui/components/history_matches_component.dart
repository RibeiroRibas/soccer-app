import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/ui/list_item/matches_list_item.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/tittle_component.dart';

class HistoryMatchesComponent extends StatelessWidget {
  final List<TeamMatch> teamMatches;
  const HistoryMatchesComponent({
    super.key,
    required this.teamMatches,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding:
                EdgeInsets.only(top: 16.0, bottom: 8.0, left: 4.0, right: 8.0),
            child: TittleComponent(tittle: historyMatches)),
        BoxCardComponent(
          boxCardBody: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MatchesListItem(match: teamMatches[index]);
            },
            itemCount: teamMatches.length,
          ),
        ),
      ],
    );
  }
}
