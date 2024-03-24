import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
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

  @action
  Future<void> sortTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) async {
    List<Player> players = _getSelectedPlayers(selectedPlayers);

    sortedTeams.clear();
    sortedTeams = await service.sortTeamsMatch(players, matchSettings);
    final List<TeamMatch> teamMatches =
        service.generateTeamMatches(sortedTeams);

    teamsInformation = [];
    for (TeamMatch teamMatch in teamMatches) {
      List<String> teamOneInformation = _getTeamInformation(teamMatch.teamOne!);
      List<String> teamTwoInformation = _getTeamInformation(teamMatch.teamTwo!);
      final teamInformation =
          TeamInformation(teamOneInformation, teamTwoInformation);
      teamsInformation.add(teamInformation);
    }

    this.teamMatches = teamMatches;
  }

  @action
  void onTeamNameOrShieldChange(String oldName, String newNameOrShield) {
    for (TeamMatch teamMatch in teamMatches) {
      if (teamMatch.teamOne!.name == oldName) {
        if (newNameOrShield.contains(".png")) {
          teamMatch.teamOne!.shield = newNameOrShield;
        } else {
          teamMatch.teamOne!.name = newNameOrShield;
        }
        break;
      }

      if (teamMatch.teamTwo!.name == oldName) {
        if (newNameOrShield.contains(".png")) {
          teamMatch.teamTwo!.shield = newNameOrShield;
          break;
        } else {
          teamMatch.teamTwo!.name = newNameOrShield;
          break;
        }
      }
    }

    for (Team team in sortedTeams) {
      if (team.name == oldName) {
        if (newNameOrShield.contains(".png")) {
          team.shield = newNameOrShield;
          break;
        } else {
          team.name = newNameOrShield;
          break;
        }
      }
    }
    List<TeamMatch> matches = [];
    matches.addAll(teamMatches);
    teamMatches = matches;

    List<Team> teams = [];
    teams.addAll(sortedTeams);
    sortedTeams = teams;
  }

  List<String> _getTeamInformation(Team team) {
    List<String> teamInformation = [];
    teamInformation.add(team.teamOverall.value.toStringAsFixed(1));
    teamInformation.add(team.teamOverall.overallByPosition[Position.forward]!
        .toStringAsFixed(1));
    teamInformation.add(team.teamOverall.overallByPosition[Position.defender]!
        .toStringAsFixed(1));
    teamInformation.add(team.teamOverall.overallByPosition[Position.midfielder]!
        .toStringAsFixed(1));
    teamInformation.add(team.teamOverall.overallByPosition[Position.leftBack]!
        .toStringAsFixed(1));
    teamInformation.add(team.teamOverall.overallByPosition[Position.rightBack]!
        .toStringAsFixed(1));
    return teamInformation;
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
}
