// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewPlayerController on NewPlayerControllerBase, Store {
  late final _$allPlayersAtom =
      Atom(name: 'NewPlayerControllerBase.allPlayers', context: context);

  @override
  List<Player>? get allPlayers {
    _$allPlayersAtom.reportRead();
    return super.allPlayers;
  }

  @override
  set allPlayers(List<Player>? value) {
    _$allPlayersAtom.reportWrite(value, super.allPlayers, () {
      super.allPlayers = value;
    });
  }

  late final _$findAllPlayersAsyncAction =
      AsyncAction('NewPlayerControllerBase.findAllPlayers', context: context);

  @override
  Future<void> findAllPlayers() {
    return _$findAllPlayersAsyncAction.run(() => super.findAllPlayers());
  }

  late final _$savePlayerAsyncAction =
      AsyncAction('NewPlayerControllerBase.savePlayer', context: context);

  @override
  Future<void> savePlayer(Player player) {
    return _$savePlayerAsyncAction.run(() => super.savePlayer(player));
  }

  @override
  String toString() {
    return '''
allPlayers: ${allPlayers}
    ''';
  }
}
