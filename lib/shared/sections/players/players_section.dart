import 'package:flutter/material.dart';

import 'package:team_draw/shared/sections/players/player_lineup.dart';
import 'package:team_draw/shared/section_tittle.dart';

import '../../components/box_card.dart';

class Players extends StatelessWidget {
  const Players({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SectionTittle(
            tittle: "Jogadores",
            icon: Icons.person_add,
          ),
          BoxCard(
            boxCardBody: PlayerLineup(),
            height: 170,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}