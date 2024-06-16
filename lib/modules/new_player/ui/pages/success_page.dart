import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/ui/pages/page_views/players_page_view.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/new_player_rote_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_with_close_button_component.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';

class SuccessView extends StatefulWidget {
  final List<PlayerScore> playersScore;

  const SuccessView({super.key, required this.playersScore});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  final _navigator = Modular.get<NewPlayerRouteNavigator>();
  bool _isShowSuccess = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500))
        .then((_) => setState(() => _isShowSuccess = false));
  }

  @override
  Widget build(BuildContext context) {
    return _isShowSuccess
        ? Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(child: Lottie.asset('assets/animations/success.json')),
          )
        : Scaffold(
            appBar: AppBarTittleWithCloseButtonComponent(
              tittle: allPlayers,
              onCloseAction: () => _navigator.goTo('$homeNavBarRoute/'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PlayersPageView(playersScore: widget.playersScore),
            ),
            bottomNavigationBar: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonComponent(
                      onButtonPressed: () => _navigator.goTo('$newPlayerRote/',
                          arguments: {"player": Player()}),
                      text: newPLayer,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonComponent(
                      onButtonPressed: () => _navigator.goTo('$newMatchRote/'),
                      text: newMatch,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
