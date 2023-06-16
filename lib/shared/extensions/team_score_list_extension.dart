
import 'package:team_draw/modules/app_navigator/model/team_score.dart';

extension TeamScoreExtension on List<TeamScore> {
  List<String> getTeamNames() {
    List<String> teamNameTableValues = [""];
    teamNameTableValues.addAll(map((e) => e.teamName).toList());
    return teamNameTableValues;
  }

  List<List<String>> getTeamScores() {
    List<List<String>> teamScoreTableValues = [["P","J","V","D","E","GS","GC"]];
    for (TeamScore teamScore in this){
      teamScoreTableValues.add(teamScore.getValuesAsString());
    }
    return teamScoreTableValues;
  }
}