// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchSettingsController on MatchSettingsControllerBase, Store {
  late final _$hasChangeSideAtom =
      Atom(name: 'MatchSettingsControllerBase.hasChangeSide', context: context);

  @override
  bool get hasChangeSide {
    _$hasChangeSideAtom.reportRead();
    return super.hasChangeSide;
  }

  @override
  set hasChangeSide(bool value) {
    _$hasChangeSideAtom.reportWrite(value, super.hasChangeSide, () {
      super.hasChangeSide = value;
    });
  }

  late final _$numberOfStartingPlayersAtom = Atom(
      name: 'MatchSettingsControllerBase.numberOfStartingPlayers',
      context: context);

  @override
  int? get numberOfStartingPlayers {
    _$numberOfStartingPlayersAtom.reportRead();
    return super.numberOfStartingPlayers;
  }

  @override
  set numberOfStartingPlayers(int? value) {
    _$numberOfStartingPlayersAtom
        .reportWrite(value, super.numberOfStartingPlayers, () {
      super.numberOfStartingPlayers = value;
    });
  }

  late final _$MatchSettingsControllerBaseActionController =
      ActionController(name: 'MatchSettingsControllerBase', context: context);

  @override
  void init(Iterable<bool> arePlayersSelected, MatchSettings matchSettings) {
    final _$actionInfo = _$MatchSettingsControllerBaseActionController
        .startAction(name: 'MatchSettingsControllerBase.init');
    try {
      return super.init(arePlayersSelected, matchSettings);
    } finally {
      _$MatchSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSide(bool changeSide) {
    final _$actionInfo = _$MatchSettingsControllerBaseActionController
        .startAction(name: 'MatchSettingsControllerBase.changeSide');
    try {
      return super.changeSide(changeSide);
    } finally {
      _$MatchSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNumberOfTeams(String value, MatchSettings matchSettings) {
    final _$actionInfo = _$MatchSettingsControllerBaseActionController
        .startAction(name: 'MatchSettingsControllerBase.updateNumberOfTeams');
    try {
      return super.updateNumberOfTeams(value, matchSettings);
    } finally {
      _$MatchSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasChangeSide: ${hasChangeSide},
numberOfStartingPlayers: ${numberOfStartingPlayers}
    ''';
  }
}
