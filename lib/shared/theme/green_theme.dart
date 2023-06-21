import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

ThemeData greenTheme = ThemeData(
  useMaterial3: true,
  primaryColor: ThemeColors.primary,
  cardColor: ThemeColors.cardColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: ThemeColors.black,
    backgroundColor: ThemeColors.primary,
  ),
  scaffoldBackgroundColor: ThemeColors.backgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ThemeColors.backgroundColor,
  ),
  appBarTheme: const AppBarTheme(color: ThemeColors.backgroundColor),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(ThemeColors.primary.value, shades),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(fontSize: 14, color: ThemeColors.white),
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ThemeColors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ThemeColors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 40),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: playFontFamily,
      ),
    ),
  ),
  fontFamily: playFontFamily,
);
