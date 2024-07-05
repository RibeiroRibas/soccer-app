import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/match_details.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/model/team_match.dart';

List<TeamMatch> getAllTeamMatches = [
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

TeamMatch matchOneVSTwo = TeamMatch(
  id: 1,
  teamOne: getTeamOne,
  teamTwo: getTeamTwo,
  scoreTeamOne: 9,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchOneVSTree = TeamMatch(
  id: 2,
  teamOne: getTeamOne,
  teamTwo: getTeamTree,
  scoreTeamOne: 15,
  scoreTeamTwo: 10,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchTwoVSTree = TeamMatch(
  id: 3,
  teamOne: getTeamTwo,
  teamTwo: getTeamTree,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchTwoVSFour = TeamMatch(
  id: 4,
  teamOne: getTeamTwo,
  teamTwo: getTeamFour,
  scoreTeamOne: 4,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchFourVSTree = TeamMatch(
  id: 5,
  teamOne: getTeamFour,
  teamTwo: getTeamTree,
  scoreTeamOne: 5,
  scoreTeamTwo: 7,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchFiveVSSix = TeamMatch(
  id: 6,
  teamOne: getTeamFive,
  teamTwo: getTeamSix,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchSixVSFour = TeamMatch(
  id: 7,
  teamOne: getTeamSix,
  teamTwo: getTeamFour,
  scoreTeamOne: 15,
  scoreTeamTwo: 12,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(
        player: rodrigo, goalTime: ['00:05:00', '00:12:00', '00:45:01']),
    PlayerGoals(player: cris, goalTime: ['00:10:00', '00:50:00']),
    PlayerGoals(player: helder, goalTime: ['00:03:00', '00:14:00']),
    PlayerGoals(player: jodir, goalTime: ['00:30:00', '00:35:50']),
    PlayerGoals(player: guilherme, goalTime: ['00:25:33', '00:15:59']),
  ],
);

TeamMatch matchSevenVSEight = TeamMatch(
  id: 8,
  teamOne: getTeamSeven,
  teamTwo: getTeamEight,
  scoreTeamOne: 2,
  scoreTeamTwo: 1,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: sid, goalTime: [
      '00:05:00',
    ]),
    PlayerGoals(player: douglas, goalTime: ['00:10:00']),
    PlayerGoals(player: helder, goalTime: ['00:15:00']),
  ],
);

TeamMatch matchSevenVSNine = TeamMatch(
  id: 9,
  teamOne: getTeamSeven,
  teamTwo: getTeamNine,
  scoreTeamOne: 2,
  scoreTeamTwo: 2,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: sid, goalTime: [
      '00:05:00',
    ]),
    PlayerGoals(player: douglas, goalTime: ['00:10:00']),
    PlayerGoals(player: rodrigo, goalTime: ['00:15:00', '00:20:00']),
  ],
);

TeamMatch matchEightVSNine = TeamMatch(
  id: 10,
  teamOne: getTeamEight,
  teamTwo: getTeamNine,
  scoreTeamOne: 3,
  scoreTeamTwo: 2,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: helder, goalTime: ['00:10:00']),
    PlayerGoals(player: guilherme, goalTime: ['00:10:00', '00:22:00']),
    PlayerGoals(player: rodrigo, goalTime: ['00:15:00', '00:20:00']),
  ],
);

MatchDetails matchDetailsOne = MatchDetails(
    matches: [matchOneVSTwo], matchSettings: getMatchSettings(6, 2));

MatchDetails matchDetailsTwo = MatchDetails(
    matches: [matchSevenVSEight, matchSevenVSNine, matchEightVSNine],
    matchSettings: getMatchSettings(5, 3));

MatchSettings getMatchSettings(int numberOfStartingPlayers, int numberOfTeams) {
  MatchSettings matchSettings = MatchSettings(
      numberOfStartingPlayers: numberOfStartingPlayers,
      numberOfTeams: numberOfTeams);
  matchSettings.durationMin = 0;
  matchSettings.durationHr = 1;
  matchSettings.timeToChangePlayer = 10;
  return matchSettings;
}

List<MatchDetails> allMatchDetails = [
  matchDetailsOne,
  matchDetailsTwo,
  matchDetailsOne
];
