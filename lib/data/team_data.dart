import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/team.dart';

const String _imageInitialPath = "assets/images";

Team getTeamOne = Team(
    name: 'Bar sem Lona',
    acronym: "BSL",
    shield: "$_imageInitialPath/logo-barcelona-256.png",
    players: playersList.getRange(0, 7).toList(),
    numberOfStartingPlayers: 6);
Team getTeamTwo = Team(
    name: 'Unidos da Bicuda',
    acronym: "UDB",
    shield: "$_imageInitialPath/logo-flamengo-256.png",
    players: playersList.getRange(7, 14).toList(),
    numberOfStartingPlayers: 6);
Team getTeamTree = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: "$_imageInitialPath/logo-avai-256.png",
    players: playersList.getRange(4, 10).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFour = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: "$_imageInitialPath/logo-avai-256.png",
    players: playersList.getRange(7, 13).toList(),
    numberOfStartingPlayers: 6);
Team getTeamFive = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: "$_imageInitialPath/logo-avai-256.png",
    players: playersList.getRange(6, 12).toList(),
    numberOfStartingPlayers: 6);
Team getTeamSix = Team(
    name: 'Super Saiyajins',
    acronym: "DBZ",
    shield: "$_imageInitialPath/logo-avai-256.png",
    players: playersList.getRange(5, 11).toList(),
    numberOfStartingPlayers: 6);

List<Team> getAllTeams = [
  getTeamOne,
  getTeamTwo,
  getTeamTree,
  getTeamFour,
  getTeamFive,
  getTeamSix
];
