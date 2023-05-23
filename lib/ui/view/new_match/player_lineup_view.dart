import 'package:flutter/material.dart';
import 'package:team_draw/ui/section/player_lineup_section.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/layout/default_page_layout.dart';

import '../../component/box_card_component.dart';
import '../../../shared/i18n/messages.dart';
import '../../section/tittle_section.dart';

class PlayerLineupView extends StatefulWidget {
  const PlayerLineupView({Key? key}) : super(key: key);

  @override
  State<PlayerLineupView> createState() => _PlayerLineupViewState();
}

class _PlayerLineupViewState extends State<PlayerLineupView> {
  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      tittle: newMatch,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          TittleSection(
            tittle: selectPlayers,
            icon: Icons.person_add,
          ),
          BoxCardComponent(
            boxCardBody: PlayerLineupSection(),
          ),
          SizedBox(height: 16.0),
        ],
      ),
      buttonNavigationBar: ElevatedButtonComponent(
        text: next,
        onButtonPressed: () {},
      ),
    );
  }
}
