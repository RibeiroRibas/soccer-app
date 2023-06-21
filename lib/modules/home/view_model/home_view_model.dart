import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/home/model/team_overall.dart';
import 'package:team_draw/modules/home/model/team_score.dart';
import 'package:team_draw/modules/home/repository/home_repository.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final HomeRepository _repository;

  HomeViewModelBase(this._repository);

  @observable
  int currentPageIndex = 0;

  List<Team> teams = <Team>[];
  List<Player> players = <Player>[];
  List<TeamMatch> allMatches = <TeamMatch>[];

  @action
  void changeIndex(int index) {
    currentPageIndex = index;
  }

  Future<void> findAllData() async {
    teams = await _repository.findAllTeams();
    players = await _repository.findAllPlayers();
    allMatches = await _repository.findAllMatches();
  }

  List<TeamScore> calculateTeamScore() {
    List<TeamScore> teamsScore = [];
    for (Team team in teams) {
      List<TeamMatch> teamMatches = [];
      teamMatches.addAll(allMatches);
      teamMatches.removeWhere(
          (element) => element.teamOne != team && element.teamTwo != team);
      TeamScore teamScore = TeamScore(team: team, matches: teamMatches);
      teamsScore.add(teamScore);
    }
    teamsScore.sort((e1, e2) => e1.compareTo(e2));
    return teamsScore;
  }

  List<TeamOverall> calculateTeamOverall() {
    List<TeamOverall> teamsOverall = [];
    for (Team team in teams) {
      teamsOverall.add(team.calculateTeamOverall());
    }
    return teamsOverall;
  }

  List<PlayerScore> calculatePlayerScore() {
    List<PlayerScore> playersScore = [];
    for (Player player in players) {
      playersScore.add(player.calculateScore(allMatches));
    }
    return playersScore;
  }
}
