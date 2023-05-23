import 'package:flutter/material.dart';
import 'package:team_draw/ui/view/home_view.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

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
      home: HomeView(),
    );
  }
}