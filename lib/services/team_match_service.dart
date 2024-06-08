import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/repositories/team_match_repository.dart';

class TeamMatchService {
  final TeamMatchRepository _repository;

  TeamMatchService(this._repository);

  Future<List<TeamMatch>> findAllMatches() async {
    return _repository.findAllMatches();
  }
}
