import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/modules/new_match/repositories/match_settings_repository.dart';

class MatchSettingsService {
  final MatchSettingsRepository repository;

  MatchSettingsService(this.repository);

  Future<void> save(MatchSettings matchSettings) async {
    await repository.writeData(matchSettings);
  }

  Future<MatchSettings?> load() async {
    return await repository.loadFromStorage();
  }
}
