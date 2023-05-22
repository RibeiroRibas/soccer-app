import 'package:flutter/cupertino.dart';
import 'package:team_draw/models/match.dart';

import '../../../data/match_data.dart';
import 'matches_widget.dart';

class AllMatchesWidget extends StatefulWidget {
  const AllMatchesWidget({Key? key}) : super(key: key);

  @override
  State<AllMatchesWidget> createState() => _AllMatchesWidgetState();
}

class _AllMatchesWidgetState extends State<AllMatchesWidget> {
  @override
  Widget build(BuildContext context) {
    List<Match> matches = allMatches;
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return MatchesWidget(match: matches[index]);
          },
          itemCount: matches.length,
          scrollDirection: Axis.horizontal,
        ),
    );
  }
}