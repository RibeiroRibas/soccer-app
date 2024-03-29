import 'package:flutter/cupertino.dart';
import 'package:team_draw/model/team_match.dart';
import 'matches_item_widget.dart';

class AllMatchesWidget extends StatelessWidget {
  final List<TeamMatch> teamMatches;
  const AllMatchesWidget({super.key, required this.teamMatches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MatchesItemWidget(match: teamMatches[index]);
      },
      itemCount: teamMatches.length,
    );
  }
}
