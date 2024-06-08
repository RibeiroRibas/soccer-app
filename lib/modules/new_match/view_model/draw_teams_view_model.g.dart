// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_teams_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DrawTeamsViewModel on DrawTeamsViewModelBase, Store {
  late final _$onUpdateDateAtom =
      Atom(name: 'DrawTeamsViewModelBase.onUpdateDate', context: context);

  @override
  bool get onUpdateDate {
    _$onUpdateDateAtom.reportRead();
    return super.onUpdateDate;
  }

  @override
  set onUpdateDate(bool value) {
    _$onUpdateDateAtom.reportWrite(value, super.onUpdateDate, () {
      super.onUpdateDate = value;
    });
  }

  late final _$sortTeamsMatchAsyncAction =
      AsyncAction('DrawTeamsViewModelBase.sortTeamsMatch', context: context);

  @override
  Future<void> sortTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) {
    return _$sortTeamsMatchAsyncAction
        .run(() => super.sortTeamsMatch(selectedPlayers, matchSettings));
  }

  late final _$DrawTeamsViewModelBaseActionController =
      ActionController(name: 'DrawTeamsViewModelBase', context: context);

  @override
  void onTeamNameChange(String oldTeamName, String newTeamName) {
    final _$actionInfo = _$DrawTeamsViewModelBaseActionController.startAction(
        name: 'DrawTeamsViewModelBase.onTeamNameChange');
    try {
      return super.onTeamNameChange(oldTeamName, newTeamName);
    } finally {
      _$DrawTeamsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTeamShieldChange(TeamShield oldTeamShield, TeamShield newTeamShield) {
    final _$actionInfo = _$DrawTeamsViewModelBaseActionController.startAction(
        name: 'DrawTeamsViewModelBase.onTeamShieldChange');
    try {
      return super.onTeamShieldChange(oldTeamShield, newTeamShield);
    } finally {
      _$DrawTeamsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchPlayers(Player player, Player anotherPlayer) {
    final _$actionInfo = _$DrawTeamsViewModelBaseActionController.startAction(
        name: 'DrawTeamsViewModelBase.switchPlayers');
    try {
      return super.switchPlayers(player, anotherPlayer);
    } finally {
      _$DrawTeamsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onUpdateDate: ${onUpdateDate}
    ''';
  }
}
