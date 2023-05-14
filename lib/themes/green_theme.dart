import 'package:flutter/material.dart';
import 'package:team_draw/themes/theme_colors.dart';

ThemeData greenTheme = ThemeData(
  primaryColor: ThemeColors.primary,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(ThemeColors.primary.value,shades),
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  ),
  fontFamily: 'Poppins',
);
