import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/themes/theme_colors.dart';

ThemeData greenTheme = ThemeData(
  primaryColor: ThemeColors.primary,
  cardColor: ThemeColors.cardColor,
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
    displayMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
