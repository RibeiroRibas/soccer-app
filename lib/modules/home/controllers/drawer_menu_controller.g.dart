// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DrawerMenuController on DrawerControllerBase, Store {
  late final _$imageAtom =
      Atom(name: 'DrawerControllerBase.image', context: context);

  @override
  String? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$isMediaLocationPermanentlyDeniedAtom = Atom(
      name: 'DrawerControllerBase.isMediaLocationPermanentlyDenied',
      context: context);

  @override
  bool get isMediaLocationPermanentlyDenied {
    _$isMediaLocationPermanentlyDeniedAtom.reportRead();
    return super.isMediaLocationPermanentlyDenied;
  }

  @override
  set isMediaLocationPermanentlyDenied(bool value) {
    _$isMediaLocationPermanentlyDeniedAtom
        .reportWrite(value, super.isMediaLocationPermanentlyDenied, () {
      super.isMediaLocationPermanentlyDenied = value;
    });
  }

  @override
  String toString() {
    return '''
image: ${image},
isMediaLocationPermanentlyDenied: ${isMediaLocationPermanentlyDenied}
    ''';
  }
}
