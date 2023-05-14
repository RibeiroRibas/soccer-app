import 'package:team_draw/models/match_settings.dart';
import 'package:team_draw/models/team.dart';
import 'package:team_draw/models/match.dart';
import 'package:team_draw/players_data.dart';

const String _imageInitialPath = "assets/images";

Team getTeamOne = Team(
    name: 'Bar sem Lona',
    acronym: "BSL",
    shield: "$_imageInitialPath/logo-barcelona-256.png",
    players: playersList.getRange(0, 7).toList());
Team getTeamTwo = Team(
    name: 'Unidos da Bicuda',
    acronym: "UDB",
    shield: "$_imageInitialPath/logo-flamengo-256.png",
    players: playersList.getRange(6, 14).toList());
Team getTeamTree = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: "$_imageInitialPath/logo-avai-256.png",
    players: playersList.getRange(6, 14).toList());

List<Match> allMatches = [
  Match(
      teamOne: getTeamOne,
      teamTwo: getTeamTwo,
      scoreTeamOne: 10,
      scoreTeamTwo: 8,
      startMatch: DateTime.now()),
  Match(
    teamOne: getTeamOne,
    teamTwo: getTeamTree,
    scoreTeamOne: 15,
    scoreTeamTwo: 10,
    startMatch: DateTime.now(),
  ),
  Match(
    teamOne: getTeamTwo,
    teamTwo: getTeamTree,
    scoreTeamOne: 9,
    scoreTeamTwo: 9,
    startMatch: DateTime.now(),
  ),
];
MatchSettings matchSettings = MatchSettings(
  duration: 1,
  hasReservePlayer: true,
  timeToChangePlayer: 10,
);
