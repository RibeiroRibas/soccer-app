import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app_navigator/view_model/app_navigator_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/box_card_component.dart';
import 'package:team_draw/ui/section/player_lineup_section.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/layout/default_page_layout.dart';
import 'package:team_draw/ui/section/tittle_section.dart';


class PlayerLineupView extends StatelessWidget {
  const PlayerLineupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppNavigatorViewModel controller =
    Modular.get<AppNavigatorViewModel>();
    List<Player> players = controller.players;

    return DefaultPageLayout(
      tittle: newMatch,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const TittleSection(
            tittle: selectPlayers,
            icon: Icons.person_add,
          ),
          BoxCardComponent(
            boxCardBody: PlayerLineupSection(players: players),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
      buttonNavigationBar: ElevatedButtonComponent(
        text: next,
        onButtonPressed: () {},
      ),
    );
  }
}
