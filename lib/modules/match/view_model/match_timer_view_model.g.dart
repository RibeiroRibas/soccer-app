// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_timer_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchTimerViewModel on MatchTimerViewModelBase, Store {
  late final _$hourAtom =
      Atom(name: 'MatchTimerViewModelBase.hour', context: context);

  @override
  int get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(int value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: 'MatchTimerViewModelBase.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: 'MatchTimerViewModelBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: 'MatchTimerViewModelBase.isPaused', context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$isStoppedAtom =
      Atom(name: 'MatchTimerViewModelBase.isStopped', context: context);

  @override
  bool get isStopped {
    _$isStoppedAtom.reportRead();
    return super.isStopped;
  }

  @override
  set isStopped(bool value) {
    _$isStoppedAtom.reportWrite(value, super.isStopped, () {
      super.isStopped = value;
    });
  }

  late final _$minutesToChangePlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.minutesToChangePlayer', context: context);

  @override
  int get minutesToChangePlayer {
    _$minutesToChangePlayerAtom.reportRead();
    return super.minutesToChangePlayer;
  }

  @override
  set minutesToChangePlayer(int value) {
    _$minutesToChangePlayerAtom.reportWrite(value, super.minutesToChangePlayer,
        () {
      super.minutesToChangePlayer = value;
    });
  }

  late final _$secondsToChangePlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.secondsToChangePlayer', context: context);

  @override
  int get secondsToChangePlayer {
    _$secondsToChangePlayerAtom.reportRead();
    return super.secondsToChangePlayer;
  }

  @override
  set secondsToChangePlayer(int value) {
    _$secondsToChangePlayerAtom.reportWrite(value, super.secondsToChangePlayer,
        () {
      super.secondsToChangePlayer = value;
    });
  }

  late final _$isTimeToChangePlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.isTimeToChangePlayer', context: context);

  @override
  bool get isTimeToChangePlayer {
    _$isTimeToChangePlayerAtom.reportRead();
    return super.isTimeToChangePlayer;
  }

  @override
  set isTimeToChangePlayer(bool value) {
    _$isTimeToChangePlayerAtom.reportWrite(value, super.isTimeToChangePlayer,
        () {
      super.isTimeToChangePlayer = value;
    });
  }

  late final _$isAlmostTimeToChangePlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.isAlmostTimeToChangePlayer',
      context: context);

  @override
  bool get isAlmostTimeToChangePlayer {
    _$isAlmostTimeToChangePlayerAtom.reportRead();
    return super.isAlmostTimeToChangePlayer;
  }

  @override
  set isAlmostTimeToChangePlayer(bool value) {
    _$isAlmostTimeToChangePlayerAtom
        .reportWrite(value, super.isAlmostTimeToChangePlayer, () {
      super.isAlmostTimeToChangePlayer = value;
    });
  }

  late final _$MatchTimerViewModelBaseActionController =
      ActionController(name: 'MatchTimerViewModelBase', context: context);

  @override
  void init(TeamMatch match, int timeToChangePlayer) {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.init');
    try {
      return super.init(match, timeToChangePlayer);
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void minusSeconds() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.minusSeconds');
    try {
      return super.minusSeconds();
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTimer() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.resetTimer');
    try {
      return super.resetTimer();
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void plusSeconds() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.plusSeconds');
    try {
      return super.plusSeconds();
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startReservePlayerTimer() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.startReservePlayerTimer');
    try {
      return super.startReservePlayerTimer();
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startMatchTimer() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.startMatchTimer');
    try {
      return super.startMatchTimer();
    } finally {
      _$MatchTimerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hour: ${hour},
minutes: ${minutes},
seconds: ${seconds},
isPaused: ${isPaused},
isStopped: ${isStopped},
minutesToChangePlayer: ${minutesToChangePlayer},
secondsToChangePlayer: ${secondsToChangePlayer},
isTimeToChangePlayer: ${isTimeToChangePlayer},
isAlmostTimeToChangePlayer: ${isAlmostTimeToChangePlayer}
    ''';
  }
}
