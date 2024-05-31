import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/shared/helper/date_time_format_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class MatchesItemWidget extends StatefulWidget {
  final TeamMatch match;

  const MatchesItemWidget({super.key, required this.match});

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
              width: _calculateCellWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.match.teamOne!.acronym!),
                  Image(
                    image:
                        AssetImage(widget.match.teamOne!.shield!.resourcePath),
                    height: 35,
                  ),
                ],
              )),
          SizedBox(
              width: _calculateCellWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.match.scoreTeamOne.toString()),
                  const Text(versus),
                  Text(widget.match.scoreTeamTwo.toString()),
                ],
              )),
          SizedBox(
            width: _calculateCellWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(widget.match.teamTwo!.shield!.resourcePath),
                  height: 35,
                ),
                Text(widget.match.teamTwo!.acronym!),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
            child: Divider(),
          ),
          Container(
            alignment: Alignment.center,
            width: _calculateCellWidth(context),
            child: Text(
              DateTimeFormatHelper.fromDateTimeToString(
                  widget.match.matchDate!),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateCellWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 5.0;
}
