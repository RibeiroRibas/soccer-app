import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/app_module.dart';
import 'package:team_draw/modules/theme/theme_view_model/theme_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeViewModel themeModel = Modular.get<ThemeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GestureDetector(
        onTap: () => FocusNodeHelper.dismissKeyboard(context),
        child: MaterialApp.router(
          title: 'Só Pra Rir FC',
          theme: themeModel.currentTheme,
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
