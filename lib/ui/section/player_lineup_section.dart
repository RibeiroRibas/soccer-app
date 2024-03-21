import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';

class PlayerLineupSection extends StatelessWidget {
  final List<Player> players;
  const PlayerLineupSection({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
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
            return Container();
          }),
        ),
      ),
    );
  }
}
