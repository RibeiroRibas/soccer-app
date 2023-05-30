import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/team_match.dart';

import '../../../../data/match_data.dart';
import 'matches_item_widget.dart';

class AllMatchesWidget extends StatefulWidget {
  const AllMatchesWidget({Key? key}) : super(key: key);

  @override
  State<AllMatchesWidget> createState() => _AllMatchesWidgetState();
}

class _AllMatchesWidgetState extends State<AllMatchesWidget> {
  @override
  Widget build(BuildContext context) {
    List<TeamMatch> matches = getAllMatches;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.0,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return MatchesItemWidget(match: matches[index]);
          },
          itemCount: matches.length,
          scrollDirection: Axis.vertical,
        ),
    );
  }
}