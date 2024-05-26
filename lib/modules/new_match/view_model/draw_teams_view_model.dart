import 'package:mobx/mobx.dart';
import 'package:team_draw/data/team_name_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/model/team_shield.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/modules/new_match/services/sort_teams_service.dart';

part 'draw_teams_view_model.g.dart';

class DrawTeamsViewModel = DrawTeamsViewModelBase with _$DrawTeamsViewModel;

abstract class DrawTeamsViewModelBase with Store {
  final SortTeamsService service;

  DrawTeamsViewModelBase(this.service);

  @observable
  List<TeamMatch> teamMatches = [];

  @observable
  List<TeamInformation> teamsInformation = [];

  @observable
  List<Team> sortedTeams = [];

  List<String> availableNames = [];

  @action
  Future<void> sortTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) async {
    List<Player> players = _getSelectedPlayers(selectedPlayers);

    sortedTeams.clear();
    availableNames.clear();
    sortedTeams = await service.sortTeamsMatch(players, matchSettings);
    final List<TeamMatch> teamMatches =
        service.generateTeamMatches(sortedTeams);

    _setAvailableNames();

    teamsInformation = [];
    for (TeamMatch teamMatch in teamMatches) {
      List<String> teamOneInformation = teamMatch.teamOne!.getTeamInformation();
      List<String> teamTwoInformation = teamMatch.teamTwo!.getTeamInformation();
      final teamInformation =
          TeamInformation(teamOneInformation, teamTwoInformation);
      teamsInformation.add(teamInformation);
      availableNames.removeWhere((name) => teamMatch.teamOne!.name == name);
      availableNames.removeWhere((name) => teamMatch.teamTwo!.name == name);
    }

    this.teamMatches = teamMatches;
  }

  void onTeamNameChange(String oldTeamName, String newTeamName) {
    if (sortedTeams.any((team) => team.name == newTeamName)) {
      return;
    }

    for (Team team in sortedTeams) {
      if (team.name == oldTeamName) {
        team.name = newTeamName;
        for (TeamMatch teamMatch in teamMatches) {
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
    _updateTeamObservables();
  }

  @action
  void _updateTeamObservables() {
    List<TeamMatch> matches = [];
    matches.addAll(teamMatches);
    teamMatches = matches;

    List<Team> teams = [];
    teams.addAll(sortedTeams);
    sortedTeams = teams;
  }

  @action
  void onTeamShieldChange(TeamShield oldTeamShield, TeamShield newTeamShield) {
    if (sortedTeams.any((team) => team.shield! == newTeamShield)) {
      return;
    }

    for (Team team in sortedTeams) {
      if (team.shield == oldTeamShield) {
        team.shield = newTeamShield;
        for (TeamMatch teamMatch in teamMatches) {
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
    _updateTeamObservables();
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
}
