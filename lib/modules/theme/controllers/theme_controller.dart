import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/model/theme_name.dart';
import 'package:team_draw/shared/theme/default_theme.dart';
import 'package:team_draw/shared/theme/theme_resolve.dart';

part 'theme_controller.g.dart';

class ThemeController = ThemeControllerBase with _$ThemeController;

abstract class ThemeControllerBase with Store {
  final ThemeRepository themeRepository;

  ThemeControllerBase(this.themeRepository);

  @observable
  ThemeData currentTheme = defaultTheme;

  @observable
  bool? isGoToSelectedTheme;

  @observable
  bool onThemeChange = false;

  @action
  Future<void> loadFromStorage() async {
    ThemeData? themeFromStorage = await themeRepository.loadFromStorage();
    if (themeFromStorage != null) {
      currentTheme = themeFromStorage;
      isGoToSelectedTheme = false;
    } else {
      isGoToSelectedTheme = true;
    }
  }

  @action
  Future<void> setSelectedTheme(ThemeName themeName) async {
    await themeRepository.writeData(themeName);
    currentTheme = ThemeResolve.fromThemeName(themeName);
    onThemeChange = !onThemeChange;
  }
}
