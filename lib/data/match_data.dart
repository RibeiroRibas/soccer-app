import 'package:team_draw/data/player_data.dart';
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
  matchTwoVSFour,
  matchOneVSTwo,
  matchOneVSTree,
  matchTwoVSTree,
  matchFiveVSSix,
  matchFourVSTree,
  matchSixVSFour,
];

MatchSettings getMatchSettings = MatchSettings(
    durationHr: 1,
    durationMin: 0,
    hasChangeSide: false,
    hasReservePlayer: true,
    timeToChangePlayer: 10,
    isDrawNewTeams: true,
    numberOfStartingPlayers: 6,
    numberOfTeams: 2);

TeamMatch matchOneVSTwo = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTwo,
  scoreTeamOne: 9,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);

TeamMatch matchOneVSTree = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTree,
  scoreTeamOne: 15,
  scoreTeamTwo: 10,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);

TeamMatch matchTwoVSTree = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamTree,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);
TeamMatch matchTwoVSFour = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamFour,
  scoreTeamOne: 4,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);
TeamMatch matchFourVSTree = TeamMatch(
  teamOne: getTeamFour,
  teamTwo: getTeamTree,
  scoreTeamOne: 5,
  scoreTeamTwo: 7,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);
TeamMatch matchFiveVSSix = TeamMatch(
  teamOne: getTeamFive,
  teamTwo: getTeamSix,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);
TeamMatch matchSixVSFour = TeamMatch(
  teamOne: getTeamSix,
  teamTwo: getTeamFour,
  scoreTeamOne: 15,
  scoreTeamTwo: 12,
  matchDate: DateTime.now(),
  playerGoals: {
    ribeiro: 3,
    rodrigo: 2,
    helton: 2,
    neny: 5,
    sid: 3,
    guilherme: 1,
    douglas: 1,
    pedro: 1,
    helder: 2,
    jodir: 1,
    cris: 3,
    cleber: 1,
    diego: 3,
    bruno: 2
  },
);
