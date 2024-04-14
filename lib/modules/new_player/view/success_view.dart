import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/home/view/players/players_view.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';

class SuccessView extends StatefulWidget {
  final List<PlayerScore> playersScore;

  const SuccessView({super.key, required this.playersScore});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  bool isShowSuccess = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((_) => setState(() => isShowSuccess = false));
  }

  @override
  Widget build(BuildContext context) {
    return isShowSuccess
        ? Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(child: Lottie.asset('assets/animations/success.json')),
          )
        : Scaffold(
            appBar: AppBar(title: const Center(child: Text(allPlayers))),
            body: PlayersView(playersScore: widget.playersScore),
            bottomNavigationBar: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonComponent(
                      onButtonPressed: () =>
                          navigator.goTo('$newPlayerRote/', null),
                      text: newPLayer,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonComponent(
                      onButtonPressed: () =>
                          navigator.goTo('$homeNavBarRoute/', null),
                      text: finish,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
