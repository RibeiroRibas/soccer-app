import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/team.dart';

class GenerateTeamShieldService {
  final List<String> _temporaryUsedShields = [];

  String generateTeamShield(List<Team> allTeams) {
    String? shield;

    final List<String> allCachedShields = [];
    allCachedShields.addAll(getAllShields);

    for (Team team in allTeams) {
      allCachedShields.removeWhere((shield) => shield == team.shield);
    }

    if (allCachedShields.isNotEmpty) {
      for (String cachedShield in allCachedShields) {
        if (!_temporaryUsedShields
            .any((temporaryShield) => temporaryShield == cachedShield)) {
          shield = cachedShield;
          _temporaryUsedShields.add(cachedShield);
          break;
        }
      }
    }

    return shield ?? "$imageInitialPath/empty-shield.png";
  }
}
