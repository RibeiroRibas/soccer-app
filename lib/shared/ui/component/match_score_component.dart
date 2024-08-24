import 'package:flutter/material.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class MatchScoreComponent extends StatelessWidget {
  final TeamsMatch match;
  final bool isShowTeamName;

  const MatchScoreComponent(
      {super.key, required this.match, this.isShowTeamName = true});

  double _calculateCellWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Text(
                  isShowTeamName
                      ? match.teamOne!.name!
                      : match.teamOne!.acronym,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
              Image(
                image: AssetImage(match.teamOne!.shield!.resourcePath),
                height: 35,
              ),
            ],
          ),
        ),
        SizedBox(
            width: _calculateCellWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(match.scoreTeamOne.toString()),
                const Text(versus),
                Text(match.scoreTeamTwo.toString()),
              ],
            )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(match.teamTwo!.shield!.resourcePath),
                height: 35,
              ),
              Flexible(
                child: Text(
                  isShowTeamName
                      ? match.teamTwo!.name!
                      : match.teamTwo!.acronym,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
