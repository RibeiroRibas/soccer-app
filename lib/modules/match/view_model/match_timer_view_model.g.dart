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

  late final _$minutesToSwitchPlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.minutesToSwitchPlayer', context: context);

  @override
  int get minutesToSwitchPlayer {
    _$minutesToSwitchPlayerAtom.reportRead();
    return super.minutesToSwitchPlayer;
  }

  @override
  set minutesToSwitchPlayer(int value) {
    _$minutesToSwitchPlayerAtom.reportWrite(value, super.minutesToSwitchPlayer,
        () {
      super.minutesToSwitchPlayer = value;
    });
  }

  late final _$secondsToSwitchPlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.secondsToSwitchPlayer', context: context);

  @override
  int get secondsToSwitchPlayer {
    _$secondsToSwitchPlayerAtom.reportRead();
    return super.secondsToSwitchPlayer;
  }

  @override
  set secondsToSwitchPlayer(int value) {
    _$secondsToSwitchPlayerAtom.reportWrite(value, super.secondsToSwitchPlayer,
        () {
      super.secondsToSwitchPlayer = value;
    });
  }

  late final _$isTimeToSwitchPlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.isTimeToSwitchPlayer', context: context);

  @override
  bool get isTimeToSwitchPlayer {
    _$isTimeToSwitchPlayerAtom.reportRead();
    return super.isTimeToSwitchPlayer;
  }

  @override
  set isTimeToSwitchPlayer(bool value) {
    _$isTimeToSwitchPlayerAtom.reportWrite(value, super.isTimeToSwitchPlayer,
        () {
      super.isTimeToSwitchPlayer = value;
    });
  }

  late final _$isAlmostTimeToSwitchPlayerAtom = Atom(
      name: 'MatchTimerViewModelBase.isAlmostTimeToSwitchPlayer',
      context: context);

  @override
  bool get isAlmostTimeToSwitchPlayer {
    _$isAlmostTimeToSwitchPlayerAtom.reportRead();
    return super.isAlmostTimeToSwitchPlayer;
  }

  @override
  set isAlmostTimeToSwitchPlayer(bool value) {
    _$isAlmostTimeToSwitchPlayerAtom
        .reportWrite(value, super.isAlmostTimeToSwitchPlayer, () {
      super.isAlmostTimeToSwitchPlayer = value;
    });
  }

  late final _$isDisableAutomaticSwitchAtom = Atom(
      name: 'MatchTimerViewModelBase.isDisableAutomaticSwitch',
      context: context);

  @override
  bool get isDisableAutomaticSwitch {
    _$isDisableAutomaticSwitchAtom.reportRead();
    return super.isDisableAutomaticSwitch;
  }

  @override
  set isDisableAutomaticSwitch(bool value) {
    _$isDisableAutomaticSwitchAtom
        .reportWrite(value, super.isDisableAutomaticSwitch, () {
      super.isDisableAutomaticSwitch = value;
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
  void onDisableAutomaticSwitch() {
    final _$actionInfo = _$MatchTimerViewModelBaseActionController.startAction(
        name: 'MatchTimerViewModelBase.onDisableAutomaticSwitch');
    try {
      return super.onDisableAutomaticSwitch();
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
minutesToSwitchPlayer: ${minutesToSwitchPlayer},
secondsToSwitchPlayer: ${secondsToSwitchPlayer},
isTimeToSwitchPlayer: ${isTimeToSwitchPlayer},
isAlmostTimeToSwitchPlayer: ${isAlmostTimeToSwitchPlayer},
isDisableAutomaticSwitch: ${isDisableAutomaticSwitch}
    ''';
  }
}
