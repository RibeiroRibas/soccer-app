import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/shared/repositories/team_match_repository.dart';

class TeamMatchService {
  final TeamMatchRepository _repository;

  TeamMatchService(this._repository);

  Future<List<TeamsMatch>> findAllMatches() async {
    return _repository.findAllMatches();
  }
}
