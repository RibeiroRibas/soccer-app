// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerViewModel on PlayerViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: 'PlayerViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$allPlayersAtom =
      Atom(name: 'PlayerViewModelBase.allPlayers', context: context);

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
      AsyncAction('PlayerViewModelBase.findAllPlayers', context: context);

  @override
  Future<void> findAllPlayers() {
    return _$findAllPlayersAsyncAction.run(() => super.findAllPlayers());
  }

  late final _$savePlayerAsyncAction =
      AsyncAction('PlayerViewModelBase.savePlayer', context: context);

  @override
  Future<void> savePlayer(Player player) {
    return _$savePlayerAsyncAction.run(() => super.savePlayer(player));
  }

  late final _$PlayerViewModelBaseActionController =
      ActionController(name: 'PlayerViewModelBase', context: context);

  @override
  void changeCurrentPageIndex(int index) {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.changeCurrentPageIndex');
    try {
      return super.changeCurrentPageIndex(index);
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
allPlayers: ${allPlayers}
    ''';
  }
}
