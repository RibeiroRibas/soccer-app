import 'dart:convert';

import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';

class MatchSettingsRepository {
  final LocalStorageRepository matchSettingsRepository;

  MatchSettingsRepository(this.matchSettingsRepository);

  final _matchSettingsKey = "match_settings";

  Future<MatchSettings?> loadFromStorage() async {
    String? matchSettings =
        await matchSettingsRepository.read(_matchSettingsKey);
    if (matchSettings == null) return null;

    return MatchSettings.fromJson(jsonDecode(matchSettings));
  }

  Future<void> writeData(MatchSettings matchSettings) async {
    Map<String, dynamic> data = matchSettings.toJson();
    await matchSettingsRepository.write(_matchSettingsKey, jsonEncode(data));
  }
}
