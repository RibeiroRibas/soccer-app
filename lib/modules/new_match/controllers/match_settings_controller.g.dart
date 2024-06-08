// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchSettingsController on MatchSettingsControllerBase, Store {
  Computed<int>? _$numberTotalOfPossibleTeamsComputed;

  @override
  int get numberTotalOfPossibleTeams =>
      (_$numberTotalOfPossibleTeamsComputed ??= Computed<int>(
              () => super.numberTotalOfPossibleTeams,
              name: 'MatchSettingsControllerBase.numberTotalOfPossibleTeams'))
          .value;
  Computed<int>? _$numberOfPlayersByTeamComputed;

  @override
  int get numberOfPlayersByTeam => (_$numberOfPlayersByTeamComputed ??=
          Computed<int>(() => super.numberOfPlayersByTeam,
              name: 'MatchSettingsControllerBase.numberOfPlayersByTeam'))
      .value;

  late final _$hasChangeSideAtom =
      Atom(name: 'MatchSettingsControllerBase.hasChangeSide', context: context);

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

  late final _$isDrawNewTeamsAtom = Atom(
      name: 'MatchSettingsControllerBase.isDrawNewTeams', context: context);

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

  late final _$numberOfTeamsAtom =
      Atom(name: 'MatchSettingsControllerBase.numberOfTeams', context: context);

  @override
  int? get numberOfTeams {
    _$numberOfTeamsAtom.reportRead();
    return super.numberOfTeams;
  }

  @override
  set numberOfTeams(int? value) {
    _$numberOfTeamsAtom.reportWrite(value, super.numberOfTeams, () {
      super.numberOfTeams = value;
    });
  }

  late final _$arePlayersSelectedAtom = Atom(
      name: 'MatchSettingsControllerBase.arePlayersSelected', context: context);

  @override
  Iterable<bool> get arePlayersSelected {
    _$arePlayersSelectedAtom.reportRead();
    return super.arePlayersSelected;
  }

  @override
  set arePlayersSelected(Iterable<bool> value) {
    _$arePlayersSelectedAtom.reportWrite(value, super.arePlayersSelected, () {
      super.arePlayersSelected = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('MatchSettingsControllerBase.init', context: context);

  @override
  Future<void> init(
      Iterable<bool> arePlayersSelected, MatchSettings matchSettings) {
    return _$initAsyncAction
        .run(() => super.init(arePlayersSelected, matchSettings));
  }

  late final _$MatchSettingsControllerBaseActionController =
      ActionController(name: 'MatchSettingsControllerBase', context: context);

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
  void drawNewTeams(bool drawNewTeams) {
    final _$actionInfo = _$MatchSettingsControllerBaseActionController
        .startAction(name: 'MatchSettingsControllerBase.drawNewTeams');
    try {
      return super.drawNewTeams(drawNewTeams);
    } finally {
      _$MatchSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNumberOfTeams(int numberOfTeams) {
    final _$actionInfo = _$MatchSettingsControllerBaseActionController
        .startAction(name: 'MatchSettingsControllerBase.changeNumberOfTeams');
    try {
      return super.changeNumberOfTeams(numberOfTeams);
    } finally {
      _$MatchSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasChangeSide: ${hasChangeSide},
isDrawNewTeams: ${isDrawNewTeams},
numberOfTeams: ${numberOfTeams},
arePlayersSelected: ${arePlayersSelected},
numberTotalOfPossibleTeams: ${numberTotalOfPossibleTeams},
numberOfPlayersByTeam: ${numberOfPlayersByTeam}
    ''';
  }
}
