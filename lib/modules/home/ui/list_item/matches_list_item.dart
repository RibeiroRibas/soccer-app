import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/shared/helper/date_time_format_helper.dart';
import 'package:team_draw/shared/ui/component/result_match_component.dart';

class MatchesListItem extends StatefulWidget {
  final TeamMatch match;

  const MatchesListItem({super.key, required this.match});

  @override
  State<MatchesListItem> createState() => _MatchesListItemState();
}

class _MatchesListItemState extends State<MatchesListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: ResultMatchComponent(
                  match: widget.match, isShowTeamName: false)),
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
