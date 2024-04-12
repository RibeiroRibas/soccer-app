import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeColors.blueDark,
    surfaceTintColor: Colors.transparent,
  ),
  drawerTheme: const DrawerThemeData(surfaceTintColor: Colors.white),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ThemeColors.overall,
    onPrimary: Colors.black,
    secondary: ThemeColors.blueDark,
    onSecondary: Colors.white,
    tertiary: ThemeColors.grayLight,
    onTertiary: ThemeColors.grayLight2,
    error: Colors.red,
    onError: Colors.white,
    background: ThemeColors.blueDark,
    onBackground: Colors.white,
    surface: ThemeColors.grayDark,
    onSurface: Colors.white,
    surfaceVariant: ThemeColors.grayLight2,
    onSurfaceVariant: ThemeColors.grayLight3,
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      minimumSize: const Size(double.infinity, 60),
      backgroundColor: ThemeColors.overall,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: playFontFamily,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ThemeColors.blueDark,
    unselectedItemColor: ThemeColors.grayLight,
    unselectedLabelStyle:
        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
    selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: playFontFamily,
      ),
      foregroundColor: ThemeColors.grayDark,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
  ),
  dividerTheme: const DividerThemeData(color: ThemeColors.grayLight3),
  fontFamily: playFontFamily,
);
