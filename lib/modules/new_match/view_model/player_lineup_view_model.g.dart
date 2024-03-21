// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_lineup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerLineupViewModel on PlayerLineupViewModelBase, Store {
  late final _$selectedPlayersAtom =
      Atom(name: 'PlayerLineupViewModelBase.selectedPlayers', context: context);

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
      'PlayerLineupViewModelBase.findAndSetAllPlayers',
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
