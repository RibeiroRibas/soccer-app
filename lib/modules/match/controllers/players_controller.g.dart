// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayersController on PlayersControllerBase, Store {
  late final _$playersAlreadyGoneToReserveAtom = Atom(
      name: 'PlayersControllerBase.playersAlreadyGoneToReserve',
      context: context);

  @override
  List<Player> get playersAlreadyGoneToReserve {
    _$playersAlreadyGoneToReserveAtom.reportRead();
    return super.playersAlreadyGoneToReserve;
  }

  @override
  set playersAlreadyGoneToReserve(List<Player> value) {
    _$playersAlreadyGoneToReserveAtom
        .reportWrite(value, super.playersAlreadyGoneToReserve, () {
      super.playersAlreadyGoneToReserve = value;
    });
  }

  late final _$playersToGetInAtom =
      Atom(name: 'PlayersControllerBase.playersToGetIn', context: context);

  @override
  List<Player> get playersToGetIn {
    _$playersToGetInAtom.reportRead();
    return super.playersToGetIn;
  }

  @override
  set playersToGetIn(List<Player> value) {
    _$playersToGetInAtom.reportWrite(value, super.playersToGetIn, () {
      super.playersToGetIn = value;
    });
  }

  late final _$playersToGetOutAtom =
      Atom(name: 'PlayersControllerBase.playersToGetOut', context: context);

  @override
  List<Player> get playersToGetOut {
    _$playersToGetOutAtom.reportRead();
    return super.playersToGetOut;
  }

  @override
  set playersToGetOut(List<Player> value) {
    _$playersToGetOutAtom.reportWrite(value, super.playersToGetOut, () {
      super.playersToGetOut = value;
    });
  }

  late final _$startingPlayersAtom =
      Atom(name: 'PlayersControllerBase.startingPlayers', context: context);

  @override
  List<Player> get startingPlayers {
    _$startingPlayersAtom.reportRead();
    return super.startingPlayers;
  }

  @override
  set startingPlayers(List<Player> value) {
    _$startingPlayersAtom.reportWrite(value, super.startingPlayers, () {
      super.startingPlayers = value;
    });
  }

  late final _$reservePlayersAtom =
      Atom(name: 'PlayersControllerBase.reservePlayers', context: context);

  @override
  List<Player> get reservePlayers {
    _$reservePlayersAtom.reportRead();
    return super.reservePlayers;
  }

  @override
  set reservePlayers(List<Player> value) {
    _$reservePlayersAtom.reportWrite(value, super.reservePlayers, () {
      super.reservePlayers = value;
    });
  }

  late final _$PlayersControllerBaseActionController =
      ActionController(name: 'PlayersControllerBase', context: context);

  @override
  void _restartPlayersToGetIn() {
    final _$actionInfo = _$PlayersControllerBaseActionController.startAction(
        name: 'PlayersControllerBase._restartPlayersToGetIn');
    try {
      return super._restartPlayersToGetIn();
    } finally {
      _$PlayersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartPlayersToGetOut() {
    final _$actionInfo = _$PlayersControllerBaseActionController.startAction(
        name: 'PlayersControllerBase._restartPlayersToGetOut');
    try {
      return super._restartPlayersToGetOut();
    } finally {
      _$PlayersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartReservePlayers() {
    final _$actionInfo = _$PlayersControllerBaseActionController.startAction(
        name: 'PlayersControllerBase._restartReservePlayers');
    try {
      return super._restartReservePlayers();
    } finally {
      _$PlayersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartStatingPlayers() {
    final _$actionInfo = _$PlayersControllerBaseActionController.startAction(
        name: 'PlayersControllerBase._restartStatingPlayers');
    try {
      return super._restartStatingPlayers();
    } finally {
      _$PlayersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartPlayersAlreadyGoneToReserve() {
    final _$actionInfo = _$PlayersControllerBaseActionController.startAction(
        name: 'PlayersControllerBase._restartPlayersAlreadyGoneToReserve');
    try {
      return super._restartPlayersAlreadyGoneToReserve();
    } finally {
      _$PlayersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playersAlreadyGoneToReserve: ${playersAlreadyGoneToReserve},
playersToGetIn: ${playersToGetIn},
playersToGetOut: ${playersToGetOut},
startingPlayers: ${startingPlayers},
reservePlayers: ${reservePlayers}
    ''';
  }
}
