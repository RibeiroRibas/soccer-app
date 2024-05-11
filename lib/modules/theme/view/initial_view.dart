import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/theme/theme_navigator_rotes.dart';
import 'package:team_draw/modules/theme/theme_view_model/theme_view_model.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final ThemeViewModel themeViewModel = Modular.get<ThemeViewModel>();
  final ThemeNavigatorRotes navigator = Modular.get<ThemeNavigatorRotes>();

  @override
  void initState() {
    super.initState();
    _loadTheFromStorage();
    reaction((_) => themeViewModel.isGoToSelectedTheme, (isGoToSelectTheme) {
      if (isGoToSelectTheme!) {
        navigator.goTo(selectThemeRoute, null);
      } else {
        navigator.goTo('$homeNavBarRoute/', null);
      }
    });
    reaction((_) => themeViewModel.onThemeChange, (_) {
      navigator.goTo('$homeNavBarRoute/', null);
    });
  }

  Future<void> _loadTheFromStorage() async {
    await Future.delayed(const Duration(seconds: 2));
    await themeViewModel.loadFromStorage();
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
