import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';
import 'package:team_draw/services/team_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;
  final TeamService teamService;

  HomeViewModelBase(
    this._playerService,
    this._teamMatchService,
    this.teamService,
  );

  @observable
  bool isLoading = true;

  List<Team> teams = <Team>[];
  List<Player> players = <Player>[];
  List<TeamMatch> allMatches = <TeamMatch>[];

  @action
  Future<void> findAllData() async {
    teams = await teamService
        .findAllTeams()
        .then((value) => calculateTeamOverall(value));
    players = await _playerService.findAllPlayers();
    allMatches = await _teamMatchService.findAllMatches();
    isLoading = false;
  }

  List<TeamScore> calculateTeamScore() {
    return teamService.calculateTeamScore(teams, allMatches);
  }

  Future<List<Team>> calculateTeamOverall(List<Team> teams) async {
    for (Team team in teams) {
      team.calculateTeamOverall();
    }
    return teams;
  }

  List<PlayerScore> calculatePlayerScore() {
    return _playerService.calculatePlayerScore(players, allMatches);
  }
}
