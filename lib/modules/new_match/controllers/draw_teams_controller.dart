import 'package:mobx/mobx.dart';
import 'package:team_draw/data/team_name_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/model/team_shield.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/modules/new_match/services/draw_teams_service.dart';

part 'draw_teams_controller.g.dart';

class DrawTeamsController = DrawTeamsControllerBase with _$DrawTeamsController;

abstract class DrawTeamsControllerBase with Store {
  final DrawTeamsService service;

  DrawTeamsControllerBase(this.service);

  List<TeamsMatch> teamMatches = [];

  List<TeamInformation> teamsInformation = [];

  List<Team> sortedTeams = [];

  List<String> availableNames = [];

  @observable
  bool onUpdateData = false;

  @action
  Future<void> drawTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) async {
    List<Player> players = _getSelectedPlayers(selectedPlayers);

    sortedTeams.clear();
    availableNames.clear();
    sortedTeams = await service.drawTeamsMatch(players, matchSettings);
    final List<TeamsMatch> teamMatches =
        service.generateTeamMatches(sortedTeams);

    _setAvailableNames();

    _getTeamInformation(teamMatches);

    this.teamMatches = teamMatches;
    onUpdateData = !onUpdateData;
  }

  void _getTeamInformation(List<TeamsMatch> teamMatches) {
    List<TeamInformation> teamsInformation = [];
    for (TeamsMatch teamMatch in teamMatches) {
      final teamInformation = teamMatch.getTeamsInformation();
      teamsInformation.add(teamInformation);
      availableNames.removeWhere((name) => teamMatch.teamOne!.name == name);
      availableNames.removeWhere((name) => teamMatch.teamTwo!.name == name);
    }
    this.teamsInformation = teamsInformation;
  }

  @action
  void onTeamNameChange(String oldTeamName, String newTeamName) {
    if (sortedTeams.any((team) => team.name == newTeamName)) {
      return;
    }

    for (Team team in sortedTeams) {
      if (team.name == oldTeamName) {
        team.name = newTeamName;
        for (TeamsMatch teamMatch in teamMatches) {
          if (teamMatch.teamOne!.name == team.name) {
            teamMatch.teamOne = team;
          }
          if (teamMatch.teamTwo!.name == team.name) {
            teamMatch.teamTwo = team;
          }
        }
        availableNames.add(oldTeamName);
        availableNames.remove(newTeamName);
        break;
      }
    }
    onUpdateData = !onUpdateData;
  }

  @action
  void onTeamShieldChange(TeamShield oldTeamShield, TeamShield newTeamShield) {
    if (sortedTeams.any((team) => team.shield! == newTeamShield)) {
      return;
    }

    for (Team team in sortedTeams) {
      if (team.shield == oldTeamShield) {
        team.shield = newTeamShield;
        for (TeamsMatch teamMatch in teamMatches) {
          if (teamMatch.teamOne!.name == team.name) {
            teamMatch.teamOne = team;
          }
          if (teamMatch.teamTwo!.name == team.name) {
            teamMatch.teamTwo = team;
          }
        }
        break;
      }
    }
    onUpdateData = !onUpdateData;
  }

  List<Player> _getSelectedPlayers(Map<Player, bool> selectedPlayers) {
    List<Player> players = [];
    selectedPlayers.forEach((player, isSelected) {
      if (isSelected) {
        players.add(player);
      }
    });
    return players;
  }

  void _setAvailableNames() {
    for (var teamName in getAllTeamNames) {
      if (!service.allTeams.any((team) => team.name == teamName)) {
        availableNames.add(teamName);
      }
    }
  }

  List<Player> getPlayersAnotherTeams(Player player) {
    List<Player> players = [];
    for (Team team in sortedTeams) {
      if (!team.players!.any((p) => p == player)) {
        players.addAll(team.players!);
      }
    }
    return players;
  }

  @action
  void switchPlayers(Player player, Player anotherPlayer) {
    int indexOfTeam = 0;
    int indexOfPlayer = 0;
    int indexOfAnotherTeam = 0;
    int indexOfAnotherPlayer = 0;
    for (int index = 0; index < sortedTeams.length; index++) {
      if (sortedTeams.elementAt(index).players!.any((p) => p == player)) {
        indexOfTeam = index;
        indexOfPlayer = sortedTeams.elementAt(index).players!.indexOf(player);
      }
      if (sortedTeams
          .elementAt(index)
          .players!
          .any((p) => p == anotherPlayer)) {
        indexOfAnotherTeam = index;
        indexOfAnotherPlayer =
            sortedTeams.elementAt(index).players!.indexOf(anotherPlayer);
      }
    }
    sortedTeams.elementAt(indexOfTeam).players![indexOfPlayer] = anotherPlayer;
    sortedTeams.elementAt(indexOfAnotherTeam).players![indexOfAnotherPlayer] =
        player;
    for (Team team in sortedTeams) {
      team.calculateOverall();
    }
    final List<TeamsMatch> teamMatches =
        service.generateTeamMatches(sortedTeams);
    _getTeamInformation(teamMatches);
    this.teamMatches = teamMatches;
    onUpdateData = !onUpdateData;
  }
}
