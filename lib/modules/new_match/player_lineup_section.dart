import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/check_box_component.dart';

import '../../data/player_data.dart';
import '../../models/player.dart';
import '../../shared/themes/green_theme.dart';

class PlayerLineupSection extends StatelessWidget {
  const PlayerLineupSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = playersList;

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
        ),
        children: List.generate(players.length, (index) {
          return Row(
            children: [
              const CheckBoxComponent(),
              Text(
                players[index].name,
                style: greenTheme.textTheme.displaySmall,
              ),
            ],
          );
        }),
      ),
    );
  }
}