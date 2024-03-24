import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';

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
}
