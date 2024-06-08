// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeController on ThemeControllerBase, Store {
  late final _$currentThemeAtom =
      Atom(name: 'ThemeControllerBase.currentTheme', context: context);

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$isGoToSelectedThemeAtom =
      Atom(name: 'ThemeControllerBase.isGoToSelectedTheme', context: context);

  @override
  bool? get isGoToSelectedTheme {
    _$isGoToSelectedThemeAtom.reportRead();
    return super.isGoToSelectedTheme;
  }

  @override
  set isGoToSelectedTheme(bool? value) {
    _$isGoToSelectedThemeAtom.reportWrite(value, super.isGoToSelectedTheme, () {
      super.isGoToSelectedTheme = value;
    });
  }

  late final _$onThemeChangeAtom =
      Atom(name: 'ThemeControllerBase.onThemeChange', context: context);

  @override
  bool get onThemeChange {
    _$onThemeChangeAtom.reportRead();
    return super.onThemeChange;
  }

  @override
  set onThemeChange(bool value) {
    _$onThemeChangeAtom.reportWrite(value, super.onThemeChange, () {
      super.onThemeChange = value;
    });
  }

  late final _$loadFromStorageAsyncAction =
      AsyncAction('ThemeControllerBase.loadFromStorage', context: context);

  @override
  Future<void> loadFromStorage() {
    return _$loadFromStorageAsyncAction.run(() => super.loadFromStorage());
  }

  late final _$setSelectedThemeAsyncAction =
      AsyncAction('ThemeControllerBase.setSelectedTheme', context: context);

  @override
  Future<void> setSelectedTheme(ThemeName themeName) {
    return _$setSelectedThemeAsyncAction
        .run(() => super.setSelectedTheme(themeName));
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
isGoToSelectedTheme: ${isGoToSelectedTheme},
onThemeChange: ${onThemeChange}
    ''';
  }
}
