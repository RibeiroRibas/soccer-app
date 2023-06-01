import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/team.dart';

import '../data/match_data.dart';
import '../model/team_match.dart';
import '../model/team_score.dart';

class HomeViewModel {
  List<TeamScore> teamScoreTable = [];


  HomeViewModel(){
    List<Team> teams = getAllTeams;
    List<TeamMatch> matches = getAllMatches;
    _calculateTeamScore(teams, matches);
  }

  void _calculateTeamScore(List<Team> teams, List<TeamMatch> allMatches) {
    for (Team team in teams) {
      List<TeamMatch> teamMatches = [];
      teamMatches.addAll(allMatches);
      teamMatches.removeWhere(
          (element) => element.teamOne != team && element.teamTwo != team);
      TeamScore teamScore = TeamScore(team: team, matches: teamMatches);
      teamScoreTable.add(teamScore);
    }
    teamScoreTable.sort((e1, e2) =>e1.compareTo(e2));
  }

  List<String> getTeamNames() {
    List<String> teamNameTableValues = [""];
    teamNameTableValues.addAll(teamScoreTable.map((e) => e.teamName).toList());
    return teamNameTableValues;
  }

  List<List<String>> getTeamScores() {
    List<List<String>> teamScoreTableValues = [["P","J","V","D","E","GS","GC"]];
    for (TeamScore teamScore in teamScoreTable){
      teamScoreTableValues.add(teamScore.getValuesAsString());
    }
    return teamScoreTableValues;
  }


}
