import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/model/match_details.dart';

class MatchDetailsRepository {
  Future<List<MatchDetails>> getAll() async {
    return allMatchDetails;
  }
}
