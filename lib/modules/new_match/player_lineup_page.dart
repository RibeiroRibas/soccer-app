import 'package:flutter/material.dart';
import 'package:team_draw/modules/new_match/player_lineup_section.dart';
import 'package:team_draw/shared/components/elevated_button_component.dart';
import 'package:team_draw/shared/layout/default_page_layout.dart';

import '../../shared/components/box_card_component.dart';
import '../../shared/i18n/messages.dart';
import '../../shared/sections/tittle_section.dart';

class PlayerLineupPage extends StatefulWidget {
  const PlayerLineupPage({Key? key}) : super(key: key);

  @override
  State<PlayerLineupPage> createState() => _PlayerLineupPageState();
}

class _PlayerLineupPageState extends State<PlayerLineupPage> {
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
