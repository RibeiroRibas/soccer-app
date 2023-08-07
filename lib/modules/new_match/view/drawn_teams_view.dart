import 'package:flutter/material.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/services/sort_teams_service.dart';

class DrawnTeamsView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const DrawnTeamsView(
      {Key? key, required this.selectedPlayers, required this.matchSettings})
      : super(key: key);

  @override
  State<DrawnTeamsView> createState() => _DrawnTeamsViewState();
}

class _DrawnTeamsViewState extends State<DrawnTeamsView> {
  late List<TeamMatch> teamMatches;

  @override
  void initState() {
    super.initState();
    _sortTeams();
  }
  Future _sortTeams() async {
    SortTeamsService service = SortTeamsService();
    widget.selectedPlayers.removeWhere((key, value) => value == false);
    List<Player> players = widget.selectedPlayers.keys.toList();
    teamMatches =
        await service.sortTeamsMatch(players, widget.matchSettings);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}
