// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerViewModel on PlayerViewModelBase, Store {
  late final _$currentViewAtom =
      Atom(name: 'PlayerViewModelBase.currentView', context: context);

  @override
  int get currentView {
    _$currentViewAtom.reportRead();
    return super.currentView;
  }

  @override
  set currentView(int value) {
    _$currentViewAtom.reportWrite(value, super.currentView, () {
      super.currentView = value;
    });
  }

  late final _$playerStateAtom =
      Atom(name: 'PlayerViewModelBase.playerState', context: context);

  @override
  PlayerState get playerState {
    _$playerStateAtom.reportRead();
    return super.playerState;
  }

  @override
  set playerState(PlayerState value) {
    _$playerStateAtom.reportWrite(value, super.playerState, () {
      super.playerState = value;
    });
  }

  late final _$savePlayerAsyncAction =
      AsyncAction('PlayerViewModelBase.savePlayer', context: context);

  @override
  Future<dynamic> savePlayer(Player player) {
    return _$savePlayerAsyncAction.run(() => super.savePlayer(player));
  }

  late final _$PlayerViewModelBaseActionController =
      ActionController(name: 'PlayerViewModelBase', context: context);

  @override
  void changeCurrentView(int index) {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.changeCurrentView');
    try {
      return super.changeCurrentView(index);
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentView: ${currentView},
playerState: ${playerState}
    ''';
  }
}
