// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchViewModel on MatchViewModelBase, Store {
  late final _$matchAtom =
      Atom(name: 'MatchViewModelBase.match', context: context);

  @override
  TeamMatch get match {
    _$matchAtom.reportRead();
    return super.match;
  }

  bool _matchIsInitialized = false;

  @override
  set match(TeamMatch value) {
    _$matchAtom.reportWrite(value, _matchIsInitialized ? super.match : null,
        () {
      super.match = value;
      _matchIsInitialized = true;
    });
  }

  late final _$scoreTeamOneAtom =
      Atom(name: 'MatchViewModelBase.scoreTeamOne', context: context);

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
      Atom(name: 'MatchViewModelBase.scoreTeamTwo', context: context);

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

  late final _$playersTeamOneAtom =
      Atom(name: 'MatchViewModelBase.playersTeamOne', context: context);

  @override
  List<Player> get playersTeamOne {
    _$playersTeamOneAtom.reportRead();
    return super.playersTeamOne;
  }

  @override
  set playersTeamOne(List<Player> value) {
    _$playersTeamOneAtom.reportWrite(value, super.playersTeamOne, () {
      super.playersTeamOne = value;
    });
  }

  late final _$playersTeamTwoAtom =
      Atom(name: 'MatchViewModelBase.playersTeamTwo', context: context);

  @override
  List<Player> get playersTeamTwo {
    _$playersTeamTwoAtom.reportRead();
    return super.playersTeamTwo;
  }

  @override
  set playersTeamTwo(List<Player> value) {
    _$playersTeamTwoAtom.reportWrite(value, super.playersTeamTwo, () {
      super.playersTeamTwo = value;
    });
  }

  late final _$reservePlayersTeamOneAtom =
      Atom(name: 'MatchViewModelBase.reservePlayersTeamOne', context: context);

  @override
  List<Player> get reservePlayersTeamOne {
    _$reservePlayersTeamOneAtom.reportRead();
    return super.reservePlayersTeamOne;
  }

  @override
  set reservePlayersTeamOne(List<Player> value) {
    _$reservePlayersTeamOneAtom.reportWrite(value, super.reservePlayersTeamOne,
        () {
      super.reservePlayersTeamOne = value;
    });
  }

  late final _$reservePlayersTeamTwoAtom =
      Atom(name: 'MatchViewModelBase.reservePlayersTeamTwo', context: context);

  @override
  List<Player> get reservePlayersTeamTwo {
    _$reservePlayersTeamTwoAtom.reportRead();
    return super.reservePlayersTeamTwo;
  }

  @override
  set reservePlayersTeamTwo(List<Player> value) {
    _$reservePlayersTeamTwoAtom.reportWrite(value, super.reservePlayersTeamTwo,
        () {
      super.reservePlayersTeamTwo = value;
    });
  }

  late final _$MatchViewModelBaseActionController =
      ActionController(name: 'MatchViewModelBase', context: context);

  @override
  void increaseScoreTeamOne() {
    final _$actionInfo = _$MatchViewModelBaseActionController.startAction(
        name: 'MatchViewModelBase.increaseScoreTeamOne');
    try {
      return super.increaseScoreTeamOne();
    } finally {
      _$MatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseScoreTeamTwo() {
    final _$actionInfo = _$MatchViewModelBaseActionController.startAction(
        name: 'MatchViewModelBase.increaseScoreTeamTwo');
    try {
      return super.increaseScoreTeamTwo();
    } finally {
      _$MatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseScoreTeamOne() {
    final _$actionInfo = _$MatchViewModelBaseActionController.startAction(
        name: 'MatchViewModelBase.decreaseScoreTeamOne');
    try {
      return super.decreaseScoreTeamOne();
    } finally {
      _$MatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseScoreTeamTwo() {
    final _$actionInfo = _$MatchViewModelBaseActionController.startAction(
        name: 'MatchViewModelBase.decreaseScoreTeamTwo');
    try {
      return super.decreaseScoreTeamTwo();
    } finally {
      _$MatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
match: ${match},
scoreTeamOne: ${scoreTeamOne},
scoreTeamTwo: ${scoreTeamTwo},
playersTeamOne: ${playersTeamOne},
playersTeamTwo: ${playersTeamTwo},
reservePlayersTeamOne: ${reservePlayersTeamOne},
reservePlayersTeamTwo: ${reservePlayersTeamTwo}
    ''';
  }
}
