import 'package:flutter/material.dart';
import 'package:team_draw/pages/home.dart';
import 'package:team_draw/pages/player_lineup_page.dart';
import 'package:team_draw/themes/green_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Só Pra Rir FC',
      theme: greenTheme,
      home: PlayerLineupPage(),
    );
  }
}