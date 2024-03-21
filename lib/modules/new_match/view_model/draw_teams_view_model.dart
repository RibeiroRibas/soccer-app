import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/modules/new_match/services/sort_teams_service.dart';

part 'draw_teams_view_model.g.dart';

class DrawTeamsViewModel = DrawTeamsViewModelBase with _$DrawTeamsViewModel;

abstract class DrawTeamsViewModelBase with Store {
  final SortTeamsService service;
  final TeamRepository teamRepository;

  DrawTeamsViewModelBase(this.service, this.teamRepository);

  @observable
  List<TeamMatch> teamMatches = [];
  List<TeamInformation> teamsInformation = [];

  @action
  Future<void> sortTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) async {
    List<Player> players = _getSelectedPlayers(selectedPlayers);
    final teamMatches = service.sortTeamsMatch(players, matchSettings);
    teamsInformation = [];
    for (var teamMatch in teamMatches) {
      List<String> teamOneInformation = _getTeamInformation(teamMatch.teamOne!);
      List<String> teamTwoInformation = _getTeamInformation(teamMatch.teamTwo!);
      final teamInformation =
          TeamInformation(teamOneInformation, teamTwoInformation);
      teamsInformation.add(teamInformation);
    }

    // List<Team> allTeams = await teamRepository.findAllTeams();
    // for(TeamMatch teamMatch in this.teamMatches){
    //   // if(teamExists(teamMatch.teamOne!, allTeams)){
    //   //   teamMatch.teamOne.
    //   // }
    // }
    this.teamMatches = teamMatches;
  }

  //
  // Team? teamExists(Team team, List<Team> teams){
  //  return teams.firstOrNull!;
  // }
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
