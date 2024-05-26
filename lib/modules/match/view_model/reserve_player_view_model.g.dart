// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReservePlayerViewModel on ReservePlayerViewModelBase, Store {
  late final _$playersToGetInAtom =
      Atom(name: 'ReservePlayerViewModelBase.playersToGetIn', context: context);

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

  late final _$playersToGetOutAtom = Atom(
      name: 'ReservePlayerViewModelBase.playersToGetOut', context: context);

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

  late final _$ReservePlayerViewModelBaseActionController =
      ActionController(name: 'ReservePlayerViewModelBase', context: context);

  @override
  void addPlayerToPlayersToGetIn(Player player) {
    final _$actionInfo =
        _$ReservePlayerViewModelBaseActionController.startAction(
            name: 'ReservePlayerViewModelBase.addPlayerToPlayersToGetIn');
    try {
      return super.addPlayerToPlayersToGetIn(player);
    } finally {
      _$ReservePlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlayerToPlayersToGetOut(Player player) {
    final _$actionInfo =
        _$ReservePlayerViewModelBaseActionController.startAction(
            name: 'ReservePlayerViewModelBase.addPlayerToPlayersToGetOut');
    try {
      return super.addPlayerToPlayersToGetOut(player);
    } finally {
      _$ReservePlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlayerToPlayerToGetIn(Player player) {
    final _$actionInfo =
        _$ReservePlayerViewModelBaseActionController.startAction(
            name: 'ReservePlayerViewModelBase.removePlayerToPlayerToGetIn');
    try {
      return super.removePlayerToPlayerToGetIn(player);
    } finally {
      _$ReservePlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlayerToPlayerToGetOut(Player player) {
    final _$actionInfo =
        _$ReservePlayerViewModelBaseActionController.startAction(
            name: 'ReservePlayerViewModelBase.removePlayerToPlayerToGetOut');
    try {
      return super.removePlayerToPlayerToGetOut(player);
    } finally {
      _$ReservePlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playersToGetIn: ${playersToGetIn},
playersToGetOut: ${playersToGetOut}
    ''';
  }
}
