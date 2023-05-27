import 'package:flutter/material.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/ui/component/box_card_component.dart';

import '../../model/team.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lineColorTable = Colors.white12;

    Color getColorLineTable() {
      lineColorTable =
          lineColorTable == Colors.white12 ? Colors.white24 : Colors.white12;
      return lineColorTable;
    }

    List<Team> teams = getAllTeams;
    return BoxCardComponent(
      boxCardBody: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              children: [
                const Text(""),
                for (Team team in teams) ...[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: 25,
                    color: getColorLineTable(),
                    child: Text(team.name),
                  )
                ]
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (String tableColumnDescription
                          in getTableDescription) ...[
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width / 1.7) / 6,
                          color: getColorLineTable(),
                          child: Text(tableColumnDescription),
                        )
                      ]
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
