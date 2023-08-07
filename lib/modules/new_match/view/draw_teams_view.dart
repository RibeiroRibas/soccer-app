import 'package:flutter/material.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';

class DrawnTeamsView extends StatelessWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const DrawnTeamsView({
    Key? key,
    required this.selectedPlayers,
    required this.matchSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
