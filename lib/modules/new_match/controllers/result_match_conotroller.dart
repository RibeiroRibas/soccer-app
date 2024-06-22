import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/extensions/player_goals_extension.dart';

class ResultMatchController {
  late TeamMatch match;
  late TeamInformation teamInformation;
  late List<String> playersGoalAtTime;

  void init(List<TeamMatch> matches) {
    match = matches.first;
    matches.remove(match);
    List<String> teamOneInformation = match.teamOne!.getTeamInformation();
    List<String> teamTwoInformation = match.teamTwo!.getTeamInformation();
    teamInformation = TeamInformation(teamOneInformation, teamTwoInformation);
    playersGoalAtTime =
        match.matchGoals != null ? match.matchGoals!.getPlayerGoalAtTime() : [];
  }
}
