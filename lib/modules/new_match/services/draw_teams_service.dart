import 'dart:math';

import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/services/generate_team_name_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_shield_service.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_service.dart';

class DrawTeamsService {
  final TeamService teamService;
  final GenerateTeamNameService generateTeamNameService;
  final GenerateTeamShieldService generateTeamShieldService;
  final PlayerService _playerService;

  DrawTeamsService(
    this.teamService,
    this.generateTeamNameService,
    this.generateTeamShieldService,
    this._playerService,
  );

  late List<Team> allTeams;

  Future<List<Team>> drawTeamsMatch(
      List<Player> players, MatchSettings settings) async {
    _playerService.initPlayersByPosition(players);
    List<Team> teams = [];

    _generateTeamsByPlayerPosition(settings, players, teams);

    _addReservePlayers(players, teams);

    await _generateTeamNameAndShield(teams);

    return teams;
  }

  Future<void> _generateTeamNameAndShield(List<Team> teams) async {
    allTeams = await teamService.findAllTeams();
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
      _playerService.addPlayersByPosition(
          team, settings.numberOfStartingPlayers, players);
      team.numberOfStartingPlayers = settings.numberOfStartingPlayers;
      team.calculateOverall();
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
}
