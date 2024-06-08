// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_lineup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerLineupController on PlayerLineupControllerBase, Store {
  late final _$selectedPlayersAtom = Atom(
      name: 'PlayerLineupControllerBase.selectedPlayers', context: context);

  @override
  ObservableMap<Player, bool> get selectedPlayers {
    _$selectedPlayersAtom.reportRead();
    return super.selectedPlayers;
  }

  @override
  set selectedPlayers(ObservableMap<Player, bool> value) {
    _$selectedPlayersAtom.reportWrite(value, super.selectedPlayers, () {
      super.selectedPlayers = value;
    });
  }

  late final _$findAndSetAllPlayersAsyncAction = AsyncAction(
      'PlayerLineupControllerBase.findAndSetAllPlayers',
      context: context);

  @override
  Future<void> findAndSetAllPlayers(Map<Player, bool> selectedPlayers) {
    return _$findAndSetAllPlayersAsyncAction
        .run(() => super.findAndSetAllPlayers(selectedPlayers));
  }

  @override
  String toString() {
    return '''
selectedPlayers: ${selectedPlayers}
    ''';
  }
}
