import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';

import '../../../../shared/i18n/messages.dart';
import '../../../../shared/theme/theme_colors.dart';

class MatchesItemWidget extends StatefulWidget {
  final TeamMatch match;

  const MatchesItemWidget({Key? key, required this.match}) : super(key: key);

  @override
  State<MatchesItemWidget> createState() => _MatchesItemWidgetState();
}

class _MatchesItemWidgetState extends State<MatchesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.match.teamOne.acronym),
              Image(
                image: AssetImage(widget.match.teamOne.shield),
                height: 35,
              ),
            ],
          )),
          SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.match.scoreTeamOne.toString()),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: Text(versus),
              ),
              Text(widget.match.scoreTeamTwo.toString()),
            ],
          )),

          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Row(
              children: [
                Image(
                  image: AssetImage(widget.match.teamTwo.shield),
                  height: 35,
                ),
                Text(widget.match.teamTwo.acronym),
              ],
            ),
          ),

          Container(
            height: 1,
            width: 10,
            decoration:
                BoxDecoration(border: Border.all(color: ThemeColors.division)),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(widget.match.matchDate.toString()))
        ],
      ),
    );
  }
}
