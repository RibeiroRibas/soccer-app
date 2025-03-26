import 'package:flutter/material.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_shield.dart';

class GenerateTeamShieldService {
  final List<TeamShield> _temporaryUsedShields = [];

  TeamShield generateTeamShield(List<Team> allTeams) {
    TeamShield? shield;

    final List<TeamShield> allCachedShields = [];
    allCachedShields.addAll(getAllShields);

    for (Team team in allTeams) {
      allCachedShields.removeWhere((shield) => shield == team.shield);
    }

    if (allCachedShields.isNotEmpty) {
      for (TeamShield cachedShield in allCachedShields) {
        if (!_temporaryUsedShields
            .any((temporaryShield) => temporaryShield == cachedShield)) {
          shield = cachedShield;
          _temporaryUsedShields.add(cachedShield);
          break;
        }
      }
    }

    return shield ??
        TeamShield(
            resourcePath: "$imageInitialPath/empty-shield.png",
            primaryColor: Colors.white,
            secondaryColor: Colors.black);
  }
}
