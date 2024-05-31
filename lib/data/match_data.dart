import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/match_goals.dart';
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

MatchSettings getMatchSettings = MatchSettings();

TeamMatch matchOneVSTwo = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTwo,
  scoreTeamOne: 9,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchOneVSTree = TeamMatch(
  teamOne: getTeamOne,
  teamTwo: getTeamTree,
  scoreTeamOne: 15,
  scoreTeamTwo: 10,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchTwoVSTree = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamTree,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchTwoVSFour = TeamMatch(
  teamOne: getTeamTwo,
  teamTwo: getTeamFour,
  scoreTeamOne: 4,
  scoreTeamTwo: 8,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchFourVSTree = TeamMatch(
  teamOne: getTeamFour,
  teamTwo: getTeamTree,
  scoreTeamOne: 5,
  scoreTeamTwo: 7,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchFiveVSSix = TeamMatch(
  teamOne: getTeamFive,
  teamTwo: getTeamSix,
  scoreTeamOne: 9,
  scoreTeamTwo: 9,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);

TeamMatch matchSixVSFour = TeamMatch(
  teamOne: getTeamSix,
  teamTwo: getTeamFour,
  scoreTeamOne: 15,
  scoreTeamTwo: 12,
  matchDate: DateTime.now(),
  matchGoals: [
    PlayerGoals(player: rodrigo, goalTime: ['000500', '001200', '004501']),
    PlayerGoals(player: cris, goalTime: ['001000', '005000']),
    PlayerGoals(player: helder, goalTime: ['000300', '001400']),
    PlayerGoals(player: jodir, goalTime: ['003000', '003550']),
    PlayerGoals(player: guilherme, goalTime: ['002533', '001559']),
  ],
);
