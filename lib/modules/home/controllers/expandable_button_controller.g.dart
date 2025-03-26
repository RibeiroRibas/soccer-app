// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expandable_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExpandableButtonController on ExpandableButtonControllerBase, Store {
  late final _$isButtonOpenAtom = Atom(
      name: 'ExpandableButtonControllerBase.isButtonOpen', context: context);

  @override
  bool get isButtonOpen {
    _$isButtonOpenAtom.reportRead();
    return super.isButtonOpen;
  }

  @override
  set isButtonOpen(bool value) {
    _$isButtonOpenAtom.reportWrite(value, super.isButtonOpen, () {
      super.isButtonOpen = value;
    });
  }

  late final _$ExpandableButtonControllerBaseActionController =
      ActionController(
          name: 'ExpandableButtonControllerBase', context: context);

  @override
  void changeButtonState() {
    final _$actionInfo = _$ExpandableButtonControllerBaseActionController
        .startAction(name: 'ExpandableButtonControllerBase.changeButtonState');
    try {
      return super.changeButtonState();
    } finally {
      _$ExpandableButtonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonOpen: ${isButtonOpen}
    ''';
  }
}
