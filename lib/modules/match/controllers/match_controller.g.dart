// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchController on MatchControllerBase, Store {
  late final _$scoreTeamOneAtom =
      Atom(name: 'MatchControllerBase.scoreTeamOne', context: context);

  @override
  int get scoreTeamOne {
    _$scoreTeamOneAtom.reportRead();
    return super.scoreTeamOne;
  }

  @override
  set scoreTeamOne(int value) {
    _$scoreTeamOneAtom.reportWrite(value, super.scoreTeamOne, () {
      super.scoreTeamOne = value;
    });
  }

  late final _$scoreTeamTwoAtom =
      Atom(name: 'MatchControllerBase.scoreTeamTwo', context: context);

  @override
  int get scoreTeamTwo {
    _$scoreTeamTwoAtom.reportRead();
    return super.scoreTeamTwo;
  }

  @override
  set scoreTeamTwo(int value) {
    _$scoreTeamTwoAtom.reportWrite(value, super.scoreTeamTwo, () {
      super.scoreTeamTwo = value;
    });
  }

  late final _$isMatchStartedAtom =
      Atom(name: 'MatchControllerBase.isMatchStarted', context: context);

  @override
  bool get isMatchStarted {
    _$isMatchStartedAtom.reportRead();
    return super.isMatchStarted;
  }

  @override
  set isMatchStarted(bool value) {
    _$isMatchStartedAtom.reportWrite(value, super.isMatchStarted, () {
      super.isMatchStarted = value;
    });
  }

  late final _$changeScoreAsyncAction =
      AsyncAction('MatchControllerBase.changeScore', context: context);

  @override
  Future<void> changeScore(bool isScoreTeamOne, bool isIncreaseScore,
      Player player, String goalTime) {
    return _$changeScoreAsyncAction.run(() =>
        super.changeScore(isScoreTeamOne, isIncreaseScore, player, goalTime));
  }

  late final _$MatchControllerBaseActionController =
      ActionController(name: 'MatchControllerBase', context: context);

  @override
  void startMatch() {
    final _$actionInfo = _$MatchControllerBaseActionController.startAction(
        name: 'MatchControllerBase.startMatch');
    try {
      return super.startMatch();
    } finally {
      _$MatchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scoreTeamOne: ${scoreTeamOne},
scoreTeamTwo: ${scoreTeamTwo},
isMatchStarted: ${isMatchStarted}
    ''';
  }
}
