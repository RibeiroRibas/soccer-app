import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/ui/section/check_box_section.dart';

class PlayerLineupSection extends StatelessWidget {
  final List<Player> players;
  const PlayerLineupSection({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Player> selectedPlayers = [];

    void onSelectedPlayer(String playerName) {
      Player selectedPlayer =
          players.singleWhere((player) => player.name == playerName);
      if (selectedPlayers.any((element) => element == selectedPlayer)) {
        selectedPlayers.remove(selectedPlayer);
      } else {
        selectedPlayers.add(selectedPlayer);
      }
    }

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
            return CheckBoxSection(
              text: players[index].name!,
              onItemSelected: (playerName) =>
                  onSelectedPlayer(playerName),
            );
          }),
        ),
      ),
    );
  }
}
