// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_match_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewMatchViewModel on NewMatchViewModelBase, Store {
  late final _$currentViewAtom =
      Atom(name: 'NewMatchViewModelBase.currentView', context: context);

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

  late final _$NewMatchViewModelBaseActionController =
      ActionController(name: 'NewMatchViewModelBase', context: context);

  @override
  void changeCurrentView(int index) {
    final _$actionInfo = _$NewMatchViewModelBaseActionController.startAction(
        name: 'NewMatchViewModelBase.changeCurrentView');
    try {
      return super.changeCurrentView(index);
    } finally {
      _$NewMatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentView: ${currentView}
    ''';
  }
}
