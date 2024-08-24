import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/model/teams_match.dart';

class TeamMatchRepository {
  Future<List<TeamsMatch>> findAllMatches() async {
    return getAllTeamMatches;
  }
}
