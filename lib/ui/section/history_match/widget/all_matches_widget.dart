import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/team_match.dart';
import 'matches_item_widget.dart';

class AllMatchesWidget extends StatelessWidget {
  final List<TeamMatch> teamMatches;
  const AllMatchesWidget({Key? key, required this.teamMatches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.0,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return MatchesItemWidget(match: teamMatches[index]);
          },
          itemCount: teamMatches.length,
          scrollDirection: Axis.vertical,
        ),
    );
  }
}