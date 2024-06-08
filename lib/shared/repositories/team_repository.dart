import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';

class TeamRepository {
  Future<List<Team>> findAllTeams() async {
    return getAllTeams;
  }

  Future<Team> findByName(String teamName) async {
    return getAllTeams.firstWhere((team) => team.name == teamName,
        orElse: () => Team());
  }

  Future<Team> findByPlayers(List<Player> players) async {
    return getAllTeams.firstWhere((team) => team.isSameTeam(players),
        orElse: () => Team());
  }
}
