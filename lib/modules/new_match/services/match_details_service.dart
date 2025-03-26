import 'package:team_draw/model/match_details.dart';
import 'package:team_draw/modules/new_match/repositories/match_details_repository.dart';

class MatchDetailsService {
  final MatchDetailsRepository _repository;

  MatchDetailsService(this._repository);

  Future<List<MatchDetails>> getAll() async {
    return await _repository.getAll();
  }
}
