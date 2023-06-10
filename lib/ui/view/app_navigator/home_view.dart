import 'package:flutter/material.dart';
import 'package:team_draw/ui/section/history_match/history_matches_section.dart';
import 'package:team_draw/ui/section/table/classification_table_section.dart';

import '../../../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();

    return CustomScrollView(
      slivers: <Widget>[
        ClassificationTableSection(
          teamNameTableValues: viewModel.getTeamNames(),
          teamScoreTableValues: viewModel.getTeamScores(),
        ),
        const HistoryMatchesSection(),
      ],
    );
  }
}
