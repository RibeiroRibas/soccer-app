// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageViewController on PageViewControllerBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: 'PageViewControllerBase.currentPageIndex', context: context);

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

  late final _$PageViewControllerBaseActionController =
      ActionController(name: 'PageViewControllerBase', context: context);

  @override
  void changeCurrentPageIndex(int index) {
    final _$actionInfo = _$PageViewControllerBaseActionController.startAction(
        name: 'PageViewControllerBase.changeCurrentPageIndex');
    try {
      return super.changeCurrentPageIndex(index);
    } finally {
      _$PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void animateToPage(int pageIndex) {
    final _$actionInfo = _$PageViewControllerBaseActionController.startAction(
        name: 'PageViewControllerBase.animateToPage');
    try {
      return super.animateToPage(pageIndex);
    } finally {
      _$PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void animateToNextPage() {
    final _$actionInfo = _$PageViewControllerBaseActionController.startAction(
        name: 'PageViewControllerBase.animateToNextPage');
    try {
      return super.animateToNextPage();
    } finally {
      _$PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$PageViewControllerBaseActionController.startAction(
        name: 'PageViewControllerBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
