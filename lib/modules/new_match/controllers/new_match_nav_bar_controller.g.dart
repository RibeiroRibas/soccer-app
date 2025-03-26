// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_match_nav_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewMatchNavBarController on NewMatchNavBarControllerBase, Store {
  late final _$isShowForwardButtonAtom = Atom(
      name: 'NewMatchNavBarControllerBase.isShowForwardButton',
      context: context);

  @override
  bool get isShowForwardButton {
    _$isShowForwardButtonAtom.reportRead();
    return super.isShowForwardButton;
  }

  @override
  set isShowForwardButton(bool value) {
    _$isShowForwardButtonAtom.reportWrite(value, super.isShowForwardButton, () {
      super.isShowForwardButton = value;
    });
  }

  late final _$NewMatchNavBarControllerBaseActionController =
      ActionController(name: 'NewMatchNavBarControllerBase', context: context);

  @override
  void showForwardButton(bool isShowButton) {
    final _$actionInfo = _$NewMatchNavBarControllerBaseActionController
        .startAction(name: 'NewMatchNavBarControllerBase.showForwardButton');
    try {
      return super.showForwardButton(isShowButton);
    } finally {
      _$NewMatchNavBarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowForwardButton: ${isShowForwardButton}
    ''';
  }
}
