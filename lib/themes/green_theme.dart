import 'package:flutter/material.dart';
import 'package:team_draw/themes/theme_colors.dart';

ThemeData greenTheme = ThemeData(
  primaryColor: ThemeColors.primary,
  cardColor: ThemeColors.cardColor,
  scaffoldBackgroundColor: ThemeColors.backgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ThemeColors.backgroundColor),
  appBarTheme: const AppBarTheme(color: ThemeColors.backgroundColor),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(ThemeColors.primary.value, shades),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  ),
  fontFamily: 'Play',
);
