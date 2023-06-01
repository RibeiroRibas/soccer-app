import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';

List<TeamMatch> getAllMatches = [
  matchOneVSTwo,
  matchOneVSTree,
  matchTwoVSTree,
  matchFiveVSSix,
  matchFourVSTree,
  matchSixVSFour,
  matchTwoVSFour
];

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
TeamMatch matchTwoVSFour = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamFour,
  scoreTeamOne: 4,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
);
TeamMatch matchFourVSTree = TeamMatch(
  teamOne: getTeamFour,
  teamTwo: getTeamTree,
  scoreTeamOne: 5,
  scoreTeamTwo: 7,
  matchDate: DateTime.now(),
);
TeamMatch matchFiveVSSix = TeamMatch(
  teamOne: getTeamFive,
  teamTwo: getTeamSix,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
);
TeamMatch matchSixVSFour = TeamMatch(
  teamOne: getTeamSix,
  teamTwo: getTeamFour,
  scoreTeamOne: 15,
  scoreTeamTwo: 12,
  matchDate: DateTime.now(),
);
