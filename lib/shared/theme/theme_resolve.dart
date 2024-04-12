import 'package:flutter/material.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/theme/theme_name.dart';
import 'package:team_draw/shared/theme/default_theme.dart';
import 'package:team_draw/shared/theme/flamengo_theme.dart';

const String flamengo = "Flamengo";

class ThemeResolve {
  static ThemeData fromName(String themeName) {
    switch (themeName) {
      case flamengo:
        return flamengoTheme;
      default:
        return defaultTheme;
    }
  }

  static String layoutFromName(ThemeName themeName) {
    switch (themeName) {
      case ThemeName.default_:
        return "$imageInitialPath/default-theme.png";
      case ThemeName.flamengo:
        return "$imageInitialPath/default-theme.png";
      default:
        return "$imageInitialPath/empty-shield.png";
    }
  }

  static ThemeData fromThemeName(ThemeName themeName) {
    switch (themeName) {
      case ThemeName.flamengo:
        return flamengoTheme;
      default:
        return defaultTheme;
    }
  }
}
