// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_navigator_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppNavigatorViewModel on AppNavigatorViewModelBase, Store {
  late final _$currentPageIndexAtom = Atom(
      name: 'AppNavigatorViewModelBase.currentPageIndex', context: context);

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

  late final _$AppNavigatorViewModelBaseActionController =
      ActionController(name: 'AppNavigatorViewModelBase', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$AppNavigatorViewModelBaseActionController
        .startAction(name: 'AppNavigatorViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$AppNavigatorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
