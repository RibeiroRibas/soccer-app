import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/modules/home/ui/list_item/matches_list_item.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/tittle_component.dart';

class HistoryMatchesComponent extends StatelessWidget {
  final List<TeamsMatch> teamMatches;

  const HistoryMatchesComponent({
    super.key,
    required this.teamMatches,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Modular.get<HomeRouteNavigator>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TittleComponent(tittle: historyMatches),
        const SizedBox(height: 8.0),
        BoxCardComponent(
          boxCardBody: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => navigator.pushNamed(
                      "$newMatchRote$matchDetailsRoute",
                      arguments: {"match": teamMatches[index]}),
                  child: MatchesListItem(match: teamMatches[index]));
            },
            itemCount: teamMatches.length,
          ),
        ),
      ],
    );
  }
}
