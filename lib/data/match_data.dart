import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/match.dart';

List<Match> allMatches = [
  Match(
    teamOne: getTeamOne,
    teamTwo: getTeamTwo,
    scoreTeamOne: 10,
    scoreTeamTwo: 8,
    matchDate: DateTime.now(),
  ),
  Match(
    teamOne: getTeamOne,
    teamTwo: getTeamTree,
    scoreTeamOne: 15,
    scoreTeamTwo: 10,
    matchDate: DateTime.now(),
  ),
  Match(
    teamOne: getTeamTwo,
    teamTwo: getTeamTree,
    scoreTeamOne: 9,
    scoreTeamTwo: 9,
    matchDate: DateTime.now(),
  ),
];
MatchSettings matchSettings = MatchSettings(
  durationTime: 1,
  hasChangeSide: false,
  hasReservePlayer: true,
  timeToChangePlayer: 10,
);
