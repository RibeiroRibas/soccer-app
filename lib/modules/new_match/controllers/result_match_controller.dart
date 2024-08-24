import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/extensions/player_goals_extension.dart';

class ResultMatchController {
  late TeamsMatch match;
  late TeamInformation teamInformation;
  late List<String> playersGoalAtTime;

  void initFromResultMatch(List<TeamsMatch> matches) {
    match = matches.first;
    matches.remove(match);
    teamInformation = match.getTeamsInformation();
    playersGoalAtTime =
        match.matchGoals != null ? match.matchGoals!.getPlayerGoalAtTime() : [];
  }

  void initFromDetailsMatch(TeamsMatch match) {
    this.match = match;
    teamInformation = match.getTeamsInformation();
    playersGoalAtTime =
        match.matchGoals != null ? match.matchGoals!.getPlayerGoalAtTime() : [];
  }
}
