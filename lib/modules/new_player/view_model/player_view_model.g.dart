// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerViewModel on PlayerViewModelBase, Store {
  late final _$stateAtom =
      Atom(name: 'PlayerViewModelBase.state', context: context);

  @override
  PlayerState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PlayerState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$principalPositionsAtom =
      Atom(name: 'PlayerViewModelBase.principalPositions', context: context);

  @override
  Map<String, bool> get principalPositions {
    _$principalPositionsAtom.reportRead();
    return super.principalPositions;
  }

  @override
  set principalPositions(Map<String, bool> value) {
    _$principalPositionsAtom.reportWrite(value, super.principalPositions, () {
      super.principalPositions = value;
    });
  }

  late final _$secondaryPositionsAtom =
      Atom(name: 'PlayerViewModelBase.secondaryPositions', context: context);

  @override
  Map<String, bool> get secondaryPositions {
    _$secondaryPositionsAtom.reportRead();
    return super.secondaryPositions;
  }

  @override
  set secondaryPositions(Map<String, bool> value) {
    _$secondaryPositionsAtom.reportWrite(value, super.secondaryPositions, () {
      super.secondaryPositions = value;
    });
  }

  late final _$changeBottomNavigationButtonsAtom = Atom(
      name: 'PlayerViewModelBase.changeBottomNavigationButtons',
      context: context);

  @override
  bool get changeBottomNavigationButtons {
    _$changeBottomNavigationButtonsAtom.reportRead();
    return super.changeBottomNavigationButtons;
  }

  @override
  set changeBottomNavigationButtons(bool value) {
    _$changeBottomNavigationButtonsAtom
        .reportWrite(value, super.changeBottomNavigationButtons, () {
      super.changeBottomNavigationButtons = value;
    });
  }

  late final _$addPlayerAsyncAction =
      AsyncAction('PlayerViewModelBase.addPlayer', context: context);

  @override
  Future<void> addPlayer() {
    return _$addPlayerAsyncAction.run(() => super.addPlayer());
  }

  late final _$PlayerViewModelBaseActionController =
      ActionController(name: 'PlayerViewModelBase', context: context);

  @override
  void changePrincipalPosition(String position) {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.changePrincipalPosition');
    try {
      return super.changePrincipalPosition(position);
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSecondaryPosition(String position) {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.changeSecondaryPosition');
    try {
      return super.changeSecondaryPosition(position);
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void bottomNavigationWithOneButton() {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.bottomNavigationWithOneButton');
    try {
      return super.bottomNavigationWithOneButton();
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void bottomNavigationWithTwoButtons() {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.bottomNavigationWithTwoButtons');
    try {
      return super.bottomNavigationWithTwoButtons();
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetObservables() {
    final _$actionInfo = _$PlayerViewModelBaseActionController.startAction(
        name: 'PlayerViewModelBase.resetObservables');
    try {
      return super.resetObservables();
    } finally {
      _$PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
principalPositions: ${principalPositions},
secondaryPositions: ${secondaryPositions},
changeBottomNavigationButtons: ${changeBottomNavigationButtons}
    ''';
  }
}
