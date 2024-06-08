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

  List<TeamMatch> teamMatches = [];

  List<TeamInformation> teamsInformation = [];

  List<Team> sortedTeams = [];

  List<String> availableNames = [];

  @observable
  bool onUpdateDate = false;

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

    _getTeamInformation(teamMatches);

    this.teamMatches = teamMatches;
    onUpdateDate = !onUpdateDate;
  }

  void _getTeamInformation(List<TeamMatch> teamMatches) {
    List<TeamInformation> teamsInformation = [];
    for (TeamMatch teamMatch in teamMatches) {
      List<String> teamOneInformation = teamMatch.teamOne!.getTeamInformation();
      List<String> teamTwoInformation = teamMatch.teamTwo!.getTeamInformation();
      final teamInformation =
          TeamInformation(teamOneInformation, teamTwoInformation);
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
    onUpdateDate = !onUpdateDate;
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
    onUpdateDate = !onUpdateDate;
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
    final List<TeamMatch> teamMatches =
        service.generateTeamMatches(sortedTeams);
    _getTeamInformation(teamMatches);
    this.teamMatches = teamMatches;
    onUpdateDate = !onUpdateDate;
  }
}
