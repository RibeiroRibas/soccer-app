// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_teams_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DrawTeamsViewModel on DrawTeamsViewModelBase, Store {
  late final _$teamMatchesAtom =
      Atom(name: 'DrawTeamsViewModelBase.teamMatches', context: context);

  @override
  List<TeamMatch> get teamMatches {
    _$teamMatchesAtom.reportRead();
    return super.teamMatches;
  }

  @override
  set teamMatches(List<TeamMatch> value) {
    _$teamMatchesAtom.reportWrite(value, super.teamMatches, () {
      super.teamMatches = value;
    });
  }

  late final _$teamsInformationAtom =
      Atom(name: 'DrawTeamsViewModelBase.teamsInformation', context: context);

  @override
  List<TeamInformation> get teamsInformation {
    _$teamsInformationAtom.reportRead();
    return super.teamsInformation;
  }

  @override
  set teamsInformation(List<TeamInformation> value) {
    _$teamsInformationAtom.reportWrite(value, super.teamsInformation, () {
      super.teamsInformation = value;
    });
  }

  late final _$sortedTeamsAtom =
      Atom(name: 'DrawTeamsViewModelBase.sortedTeams', context: context);

  @override
  List<Team> get sortedTeams {
    _$sortedTeamsAtom.reportRead();
    return super.sortedTeams;
  }

  @override
  set sortedTeams(List<Team> value) {
    _$sortedTeamsAtom.reportWrite(value, super.sortedTeams, () {
      super.sortedTeams = value;
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
  void onTeamNameOrShieldChange(
      String oldNameOrShield, String newNameOrShield) {
    final _$actionInfo = _$DrawTeamsViewModelBaseActionController.startAction(
        name: 'DrawTeamsViewModelBase.onTeamNameAdShieldChange');
    try {
      return super.onTeamNameOrShieldChange(oldNameOrShield, newNameOrShield);
    } finally {
      _$DrawTeamsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teamMatches: ${teamMatches},
teamsInformation: ${teamsInformation},
sortedTeams: ${sortedTeams}
    ''';
  }
}
