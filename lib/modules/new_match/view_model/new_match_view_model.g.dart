// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_match_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewMatchViewModel on NewMatchViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: 'NewMatchViewModelBase.currentPageIndex', context: context);

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

  late final _$NewMatchViewModelBaseActionController =
      ActionController(name: 'NewMatchViewModelBase', context: context);

  @override
  void changeCurrentPageIndex(int index) {
    final _$actionInfo = _$NewMatchViewModelBaseActionController.startAction(
        name: 'NewMatchViewModelBase.changeCurrentPageIndex');
    try {
      return super.changeCurrentPageIndex(index);
    } finally {
      _$NewMatchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
