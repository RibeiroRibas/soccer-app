import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

class MatchDetails {
  MatchSettings matchSettings;
  List<TeamMatch> matches;

  MatchDetails({required this.matches, required this.matchSettings});

  List<Team> getTeams() {
    List<Team> teams = [];
    for (TeamMatch match in matches) {
      if (!teams.any((team) => match.teamOne!.id == team.id)) {
        teams.add(match.teamOne!);
      }
      if (!teams.any((team) => match.teamTwo!.id == team.id)) {
        teams.add(match.teamTwo!);
      }
    }
    return teams;
  }

  void resetResults() {
    for (TeamMatch match in matches) {
      match.id = 0;
      match.scoreTeamOne = 0;
      match.scoreTeamTwo = 0;
      match.matchDate = DateTime.now();
      match.matchGoals = null;
    }
  }
}
