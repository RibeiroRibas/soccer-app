// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeamController on TeamControllerBase, Store {
  late final _$playersAlreadyGoneToReserveAtom = Atom(
      name: 'TeamControllerBase.playersAlreadyGoneToReserve', context: context);

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
      Atom(name: 'TeamControllerBase.playersToGetIn', context: context);

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
      Atom(name: 'TeamControllerBase.playersToGetOut', context: context);

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
      Atom(name: 'TeamControllerBase.startingPlayers', context: context);

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
      Atom(name: 'TeamControllerBase.reservePlayers', context: context);

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

  late final _$formationAtom =
      Atom(name: 'TeamControllerBase.formation', context: context);

  @override
  Formation get formation {
    _$formationAtom.reportRead();
    return super.formation;
  }

  @override
  set formation(Formation value) {
    _$formationAtom.reportWrite(value, super.formation, () {
      super.formation = value;
    });
  }

  late final _$teamFormationAtom =
      Atom(name: 'TeamControllerBase.teamFormation', context: context);

  @override
  TeamFormation get teamFormation {
    _$teamFormationAtom.reportRead();
    return super.teamFormation;
  }

  bool _teamFormationIsInitialized = false;

  @override
  set teamFormation(TeamFormation value) {
    _$teamFormationAtom.reportWrite(
        value, _teamFormationIsInitialized ? super.teamFormation : null, () {
      super.teamFormation = value;
      _teamFormationIsInitialized = true;
    });
  }

  late final _$selectedPlayerAtom =
      Atom(name: 'TeamControllerBase.selectedPlayer', context: context);

  @override
  Player? get selectedPlayer {
    _$selectedPlayerAtom.reportRead();
    return super.selectedPlayer;
  }

  @override
  set selectedPlayer(Player? value) {
    _$selectedPlayerAtom.reportWrite(value, super.selectedPlayer, () {
      super.selectedPlayer = value;
    });
  }

  late final _$selectedPositionAtom =
      Atom(name: 'TeamControllerBase.selectedPosition', context: context);

  @override
  Position? get selectedPosition {
    _$selectedPositionAtom.reportRead();
    return super.selectedPosition;
  }

  @override
  set selectedPosition(Position? value) {
    _$selectedPositionAtom.reportWrite(value, super.selectedPosition, () {
      super.selectedPosition = value;
    });
  }

  late final _$TeamControllerBaseActionController =
      ActionController(name: 'TeamControllerBase', context: context);

  @override
  void _onSelectedPlayer(Player player) {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._onSelectedPlayer');
    try {
      return super._onSelectedPlayer(player);
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartPlayersToGetIn() {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._restartPlayersToGetIn');
    try {
      return super._restartPlayersToGetIn();
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartPlayersToGetOut() {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._restartPlayersToGetOut');
    try {
      return super._restartPlayersToGetOut();
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartReservePlayers() {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._restartReservePlayers');
    try {
      return super._restartReservePlayers();
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartStatingPlayers() {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._restartStatingPlayers');
    try {
      return super._restartStatingPlayers();
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _restartPlayersAlreadyGoneToReserve() {
    final _$actionInfo = _$TeamControllerBaseActionController.startAction(
        name: 'TeamControllerBase._restartPlayersAlreadyGoneToReserve');
    try {
      return super._restartPlayersAlreadyGoneToReserve();
    } finally {
      _$TeamControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playersAlreadyGoneToReserve: ${playersAlreadyGoneToReserve},
playersToGetIn: ${playersToGetIn},
playersToGetOut: ${playersToGetOut},
startingPlayers: ${startingPlayers},
reservePlayers: ${reservePlayers},
formation: ${formation},
teamFormation: ${teamFormation},
selectedPlayer: ${selectedPlayer},
selectedPosition: ${selectedPosition}
    ''';
  }
}
