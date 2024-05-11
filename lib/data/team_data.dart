import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/team.dart';

Team getTeamOne = Team(
    name: 'Bar sem Lona',
    acronym: "BSL",
    shield: barcelona,
    players: players1,
    numberOfStartingPlayers: 6);
Team getTeamTwo = Team(
    name: 'Unidos da Bicuda',
    acronym: "UDB",
    shield: flamengo,
    players: players2,
    numberOfStartingPlayers: 6);
Team getTeamTree = Team(
    name: 'Farofas FC',
    acronym: "FAR",
    shield: avai,
    players: getAllPlayers.getRange(4, 10).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFour = Team(
    name: 'Capivaras FC',
    acronym: "CAP",
    shield: figueirense,
    players: getAllPlayers.getRange(7, 13).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFive = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: palmeiras,
    players: getAllPlayers.getRange(6, 12).toList(),
    numberOfStartingPlayers: 6);
Team getTeamSix = Team(
    name: 'Pisadinha FC',
    acronym: "PIS",
    shield: dortmund,
    players: getAllPlayers.getRange(5, 11).toList(),
    numberOfStartingPlayers: 6);

List<Team> getAllTeams = [
  getTeamOne,
  getTeamTwo,
  getTeamTree,
  getTeamFour,
  getTeamFive,
  getTeamSix
];
