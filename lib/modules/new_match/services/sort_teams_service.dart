import 'dart:math';

import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app/service/team_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_name_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_shield_service.dart';

class SortTeamsService {
  final TeamService teamService;
  final GenerateTeamNameService generateTeamNameService;
  final GenerateTeamShieldService generateTeamShieldService;

  SortTeamsService(
    this.teamService,
    this.generateTeamNameService,
    this.generateTeamShieldService,
  );

  late List<Player> _goalKeepers;
  late List<Player> _forwards;
  late List<Player> _midfielders;
  late List<Player> _defenders;
  late List<Player> _leftBacks;
  late List<Player> _rightBacks;

  Future<List<Team>> sortTeamsMatch(
      List<Player> players, MatchSettings settings) async {
    _initializeListsOfPlayersByPosition(players);

    List<Team> teams = [];

    _generateTeamsByPlayerPosition(settings, players, teams);

    _addReservePlayers(players, teams);

    await _generateTeamNameAndShield(teams);

    return teams;
  }

  Future<void> _generateTeamNameAndShield(List<Team> teams) async {
    List<Team> allTeams = await teamService.findAllTeams();
    for (Team team in teams) {
      Team repeatTeam = await teamService.findByPlayers(team.players!);
      if (repeatTeam.isPresent()) {
        team.name = repeatTeam.name;
        team.acronym = repeatTeam.acronym;
        team.shield = repeatTeam.shield;
        team.numberOfStartingPlayers = repeatTeam.numberOfStartingPlayers;
      } else {
        team.name = await generateTeamNameService.generateTeamName(allTeams);
        team.shield = generateTeamShieldService.generateTeamShield(allTeams);
      }
    }
  }

  void _addReservePlayers(List<Player> players, List<Team> teams) {
    while (players.isNotEmpty) {
      List<Team> teamsWithGoalKeeper = [];
      List<Team> teamsWithoutGoalKeeper = [];
      for (var team in teams) {
        if (team.hasGoalKeeper()) {
          teamsWithGoalKeeper.add(team);
        } else {
          teamsWithoutGoalKeeper.add(team);
        }
      }

      Team? teamWithGoalKeeperAndMinusPlayers = teamsWithGoalKeeper.firstWhere(
          (team) => teams.any((element) =>
              element != team &&
              element.players!.length >= team.players!.length),
          orElse: () => Team());

      if (teamWithGoalKeeperAndMinusPlayers.players != null) {
        int playerIndex = Random().nextInt(players.length);
        teamWithGoalKeeperAndMinusPlayers.players!
            .add(players.elementAt(playerIndex));
        players.removeAt(playerIndex);
      } else {
        for (var team in teamsWithGoalKeeper) {
          if (players.isNotEmpty) {
            int playerIndex = Random().nextInt(players.length);
            team.players!.add(players.elementAt(playerIndex));
            players.removeAt(playerIndex);
          }
        }
      }

      if (players.isNotEmpty) {
        Team? teamWithoutGoalKeeperAndMinusPlayers =
            teamsWithoutGoalKeeper.firstWhere(
                (team) => teams.any((element) =>
                    element != team &&
                    element.players!.length >= team.players!.length),
                orElse: () => Team());

        if (teamWithoutGoalKeeperAndMinusPlayers.players != null) {
          int playerIndex = Random().nextInt(players.length);
          teamWithoutGoalKeeperAndMinusPlayers.players!
              .add(players.elementAt(playerIndex));
          players.removeAt(playerIndex);
        } else {
          for (var team in teamsWithoutGoalKeeper) {
            if (players.isNotEmpty) {
              int playerIndex = Random().nextInt(players.length);
              team.players!.add(players.elementAt(playerIndex));
              players.removeAt(playerIndex);
            }
          }
        }
      }
    }
  }

  void _generateTeamsByPlayerPosition(
    MatchSettings settings,
    List<Player> players,
    List<Team> teams,
  ) {
    for (int i = 0; i < settings.numberOfTeams!; i++) {
      Team team = Team();
      team.players = [];
      do {
        if (!team.hasGoalKeeper() && _goalKeepers.isNotEmpty) {
          _addPlayer(_goalKeepers, team, players);
        }
        if (_forwards.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(_forwards, team, players);
        }
        if (_midfielders.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(_midfielders, team, players);
        }
        if (_defenders.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(_defenders, team, players);
        }
        if (_leftBacks.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(_leftBacks, team, players);
        }
        if (_rightBacks.isNotEmpty &&
            team.players!.length < settings.numberOfStartingPlayers!) {
          _addPlayer(_rightBacks, team, players);
        }
      } while (team.players!.length < settings.numberOfStartingPlayers!);
      team.numberOfStartingPlayers = settings.numberOfStartingPlayers;
      team.calculateTeamOverall();
      teams.add(team);
    }
  }

  List<TeamMatch> generateTeamMatches(List<Team> sortedTeams) {
    List<TeamMatch> matches = [];
    List<Team> teams = [];
    teams.addAll(sortedTeams);
    while (teams.length > 1) {
      Team team1 = teams.first;
      teams.remove(team1);
      for (Team team2 in teams) {
        TeamMatch teamMatch = TeamMatch(teamOne: team1, teamTwo: team2);
        matches.add(teamMatch);
      }
    }
    return matches;
  }

  void _addPlayer(
      List<Player> playersByPosition, Team team, List<Player> players) {
    int playerIndex = Random().nextInt(playersByPosition.length);
    team.players!.add(playersByPosition.elementAt(playerIndex));
    players.remove(playersByPosition.elementAt(playerIndex));
    playersByPosition.removeAt(playerIndex);
  }

  void _initializeListsOfPlayersByPosition(List<Player> players) {
    _goalKeepers = [];
    _forwards = [];
    _midfielders = [];
    _defenders = [];
    _leftBacks = [];
    _rightBacks = [];
    for (Player player in players) {
      if (player.isGoalKeeper()) {
        _goalKeepers.add(player);
      } else if (player.isForward()) {
        _forwards.add(player);
      } else if (player.isMidfielder()) {
        _midfielders.add(player);
      } else if (player.isDefender()) {
        _defenders.add(player);
      } else if (player.isLeftBack()) {
        _leftBacks.add(player);
      } else if (player.isRightBack()) {
        _rightBacks.add(player);
      }
    }
  }
}
