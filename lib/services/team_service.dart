import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/home/model/team_score.dart';

class TeamService {
  final TeamRepository repository;

  TeamService(this.repository);

  Future<Team> findByName(String teamName) async {
    return repository.findByName(teamName);
  }

  Future<Team> findByPlayers(List<Player> players) async {
    return repository.findByPlayers(players);
  }

  Future<List<Team>> findAllTeams() async {
    return getAllTeams;
  }

  List<TeamScore> calculateTeamScore(
      List<Team> teams, List<TeamMatch> allMatches) {
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
}
