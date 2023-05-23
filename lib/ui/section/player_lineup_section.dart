import 'package:flutter/material.dart';
import 'package:team_draw/ui/section/check_box_section.dart';

import '../../data/player_data.dart';
import '../../model/player.dart';

class PlayerLineupSection extends StatelessWidget {
  const PlayerLineupSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = playersList;

    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
          ),
          children: List.generate(players.length, (index) {
            return CheckBoxSection(text: players[index].name);
          }),
        ),
      ),
    );
  }
}