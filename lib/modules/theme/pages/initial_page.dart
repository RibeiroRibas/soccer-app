import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/theme/controllers/theme_controller.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/theme/theme_route_navigator.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final _themeController = Modular.get<ThemeController>();
  final _navigator = Modular.get<ThemeRouteNavigator>();

  @override
  void initState() {
    super.initState();
    _loadTheFromStorage();
    reaction((_) => _themeController.isGoToSelectedTheme, (isGoToSelectTheme) {
      if (isGoToSelectTheme!) {
        _navigator.goTo(selectThemeRoute, null);
      } else {
        _navigator.goTo('$homeNavBarRoute/', null);
      }
    });
    reaction((_) => _themeController.onThemeChange, (_) {
      _navigator.goTo('$homeNavBarRoute/', null);
    });
  }

  Future<void> _loadTheFromStorage() async {
    await Future.delayed(const Duration(seconds: 2));
    await _themeController.loadFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("$imageInitialPath/soccer-field.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: 100,
                  child: Lottie.asset('assets/animations/ball.json')),
              const Expanded(child: SizedBox()),
              const Row(
                children: [
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage(
                          "$imageInitialPath/sagrado-fut-splash.png"),
                      height: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
