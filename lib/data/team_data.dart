import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/team.dart';

Team getTeamOne = Team(
    id: 1,
    name: 'Bar sem Lona',
    acronym: "BSL",
    shield: barcelona,
    players: players1,
    numberOfStartingPlayers: 6);
Team getTeamTwo = Team(
    id: 2,
    name: 'Unidos da Bicuda',
    acronym: "UDB",
    shield: flamengo,
    players: players2,
    numberOfStartingPlayers: 6);
Team getTeamTree = Team(
    id: 3,
    name: 'Farofas FC',
    acronym: "FAR",
    shield: avai,
    players: getAllPlayers.getRange(4, 10).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFour = Team(
    id: 4,
    name: 'Capivaras FC',
    acronym: "CAP",
    shield: figueirense,
    players: getAllPlayers.getRange(7, 13).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFive = Team(
    id: 5,
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: palmeiras,
    players: getAllPlayers.getRange(6, 12).toList(),
    numberOfStartingPlayers: 6);
Team getTeamSix = Team(
    id: 6,
    name: 'Pisadinha FC',
    acronym: "PIS",
    shield: dortmund,
    players: getAllPlayers.getRange(5, 11).toList(),
    numberOfStartingPlayers: 6);
Team getTeamSeven = Team(
    id: 7,
    name: 'Time 7',
    acronym: "TM7",
    shield: dortmund,
    players: players3,
    numberOfStartingPlayers: 5);
Team getTeamEight = Team(
    id: 8,
    name: 'Time 8',
    acronym: "TM8",
    shield: flamengo,
    players: players4,
    numberOfStartingPlayers: 5);
Team getTeamNine = Team(
    id: 9,
    name: 'Time 9',
    acronym: "TM9",
    shield: palmeiras,
    players: players5,
    numberOfStartingPlayers: 5);

List<Team> getAllTeams = [
  // getTeamOne,
  // getTeamTwo,
  // getTeamTree,
  // getTeamFour,
  // getTeamFive,
  // getTeamSix
];
