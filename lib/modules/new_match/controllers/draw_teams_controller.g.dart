// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_teams_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DrawTeamsController on DrawTeamsControllerBase, Store {
  late final _$onUpdateDataAtom =
      Atom(name: 'DrawTeamsControllerBase.onUpdateData', context: context);

  @override
  bool get onUpdateData {
    _$onUpdateDataAtom.reportRead();
    return super.onUpdateData;
  }

  @override
  set onUpdateData(bool value) {
    _$onUpdateDataAtom.reportWrite(value, super.onUpdateData, () {
      super.onUpdateData = value;
    });
  }

  late final _$drawTeamsMatchAsyncAction =
      AsyncAction('DrawTeamsControllerBase.drawTeamsMatch', context: context);

  @override
  Future<void> drawTeamsMatch(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) {
    return _$drawTeamsMatchAsyncAction
        .run(() => super.drawTeamsMatch(selectedPlayers, matchSettings));
  }

  late final _$DrawTeamsControllerBaseActionController =
      ActionController(name: 'DrawTeamsControllerBase', context: context);

  @override
  void onTeamNameChange(String oldTeamName, String newTeamName) {
    final _$actionInfo = _$DrawTeamsControllerBaseActionController.startAction(
        name: 'DrawTeamsControllerBase.onTeamNameChange');
    try {
      return super.onTeamNameChange(oldTeamName, newTeamName);
    } finally {
      _$DrawTeamsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTeamShieldChange(TeamShield oldTeamShield, TeamShield newTeamShield) {
    final _$actionInfo = _$DrawTeamsControllerBaseActionController.startAction(
        name: 'DrawTeamsControllerBase.onTeamShieldChange');
    try {
      return super.onTeamShieldChange(oldTeamShield, newTeamShield);
    } finally {
      _$DrawTeamsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchPlayers(Player player, Player anotherPlayer) {
    final _$actionInfo = _$DrawTeamsControllerBaseActionController.startAction(
        name: 'DrawTeamsControllerBase.switchPlayers');
    try {
      return super.switchPlayers(player, anotherPlayer);
    } finally {
      _$DrawTeamsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onUpdateData: ${onUpdateData}
    ''';
  }
}
