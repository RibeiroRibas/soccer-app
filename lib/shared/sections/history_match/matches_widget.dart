import 'package:flutter/material.dart';
import 'package:team_draw/models/match.dart';
import 'package:team_draw/shared/components/vertical_division_component.dart';

import '../../i18n/messages.dart';

class MatchesWidget extends StatefulWidget {
  final Match match;

  const MatchesWidget({Key? key, required this.match}) : super(key: key);

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
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
          const Padding(
            padding: EdgeInsets.only(left: 4.0,right: 4.0),
            child: Text(versus),
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
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: VerticalDivisionComponent(height: 35)
          ),
        ],
      ),
    );
  }
}
