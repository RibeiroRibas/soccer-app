import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';

List<TeamMatch> getAllMatches = [matchOneVSTwo, matchOneVSTree, matchTwoVSTree];

MatchSettings matchSettings = MatchSettings(
  durationTime: 1,
  hasChangeSide: false,
  hasReservePlayer: true,
  timeToChangePlayer: 10,
);

TeamMatch matchOneVSTwo = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTwo,
  scoreTeamOne: 100,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
);

TeamMatch matchOneVSTree = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTree,
  scoreTeamOne: 15,
  scoreTeamTwo: 10,
  matchDate: DateTime.now(),
);

TeamMatch matchTwoVSTree = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamTree,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
);
