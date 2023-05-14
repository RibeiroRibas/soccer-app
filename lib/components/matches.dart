import 'package:flutter/material.dart';
import 'package:team_draw/models/match.dart';
import 'package:team_draw/themes/theme_colors.dart';

import 'sections/teams/change_player.dart';

class Matches extends StatefulWidget {
  final Match match;

  const Matches({Key? key, required this.match}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: Row(
        children: [
          Text(widget.match.teamOne.acronym),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image(
              image: AssetImage(widget.match.teamOne.shield),
              height: 35,
            ),
          ),
          Text(widget.match.scoreTeamOne.toString()),
          Padding(
            padding: const EdgeInsets.only(left: 4.0,right: 4.0),
            child: Text("X"),
          ),
          Text(widget.match.scoreTeamTwo.toString()),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image(
              image: AssetImage(widget.match.teamTwo.shield),
              height: 35,
            ),
          ),
          Text(widget.match.teamTwo.acronym),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 30,
              width: 1,
              decoration:
              BoxDecoration(border: Border.all(color: ThemeColors.division)),
            ),
          ),
        ],
      ),
    );
  }
}
