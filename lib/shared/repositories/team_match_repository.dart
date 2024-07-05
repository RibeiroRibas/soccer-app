import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/model/team_match.dart';

class TeamMatchRepository {
  Future<List<TeamMatch>> findAllMatches() async {
    return getAllTeamMatches;
  }
}
