import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/app_module.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Só Pra Rir FC',
      theme: greenTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
