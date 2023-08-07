// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchSettingsViewModel on MatchSettingsViewModelBase, Store {
  late final _$hasChangeSideAtom =
      Atom(name: 'MatchSettingsViewModelBase.hasChangeSide', context: context);

  @override
  bool? get hasChangeSide {
    _$hasChangeSideAtom.reportRead();
    return super.hasChangeSide;
  }

  @override
  set hasChangeSide(bool? value) {
    _$hasChangeSideAtom.reportWrite(value, super.hasChangeSide, () {
      super.hasChangeSide = value;
    });
  }

  late final _$hasReservePlayerAtom = Atom(
      name: 'MatchSettingsViewModelBase.hasReservePlayer', context: context);

  @override
  bool? get hasReservePlayer {
    _$hasReservePlayerAtom.reportRead();
    return super.hasReservePlayer;
  }

  @override
  set hasReservePlayer(bool? value) {
    _$hasReservePlayerAtom.reportWrite(value, super.hasReservePlayer, () {
      super.hasReservePlayer = value;
    });
  }

  late final _$isDrawNewTeamsAtom =
      Atom(name: 'MatchSettingsViewModelBase.isDrawNewTeams', context: context);

  @override
  bool? get isDrawNewTeams {
    _$isDrawNewTeamsAtom.reportRead();
    return super.isDrawNewTeams;
  }

  @override
  set isDrawNewTeams(bool? value) {
    _$isDrawNewTeamsAtom.reportWrite(value, super.isDrawNewTeams, () {
      super.isDrawNewTeams = value;
    });
  }

  late final _$MatchSettingsViewModelBaseActionController =
      ActionController(name: 'MatchSettingsViewModelBase', context: context);

  @override
  void changeSide(bool changeSide) {
    final _$actionInfo = _$MatchSettingsViewModelBaseActionController
        .startAction(name: 'MatchSettingsViewModelBase.changeSide');
    try {
      return super.changeSide(changeSide);
    } finally {
      _$MatchSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeReserve(bool changeReserve) {
    final _$actionInfo = _$MatchSettingsViewModelBaseActionController
        .startAction(name: 'MatchSettingsViewModelBase.changeReserve');
    try {
      return super.changeReserve(changeReserve);
    } finally {
      _$MatchSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void drawNewTeams(bool drawNewTeams) {
    final _$actionInfo = _$MatchSettingsViewModelBaseActionController
        .startAction(name: 'MatchSettingsViewModelBase.drawNewTeams');
    try {
      return super.drawNewTeams(drawNewTeams);
    } finally {
      _$MatchSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasChangeSide: ${hasChangeSide},
hasReservePlayer: ${hasReservePlayer},
isDrawNewTeams: ${isDrawNewTeams}
    ''';
  }
}
