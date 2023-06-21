import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/ui/section/history_match/history_matches_section.dart';
import 'package:team_draw/ui/section/table/classification_table_section.dart';

class HomeView extends StatelessWidget {
  final List<TeamScore> teamsScore;
  final List<TeamMatch> allMatches;

  const HomeView({
    Key? key,
    required this.teamsScore,
    required this.allMatches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClassificationTableSection(teamsScore: teamsScore),
          HistoryMatchesSection(
            teamMatches: allMatches,
          ),
        ],
      ),
    );
  }
}
