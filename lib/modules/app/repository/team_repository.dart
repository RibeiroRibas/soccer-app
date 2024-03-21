import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/team.dart';

class TeamRepository {
  Future<List<Team>> findAllTeams() async {
    return getAllTeams;
  }
}
