import 'package:flutter/material.dart';
import 'package:team_draw/players_data.dart';
import 'package:team_draw/models/player.dart';
import 'package:team_draw/themes/green_theme.dart';

class PlayerLineup extends StatefulWidget {
  const PlayerLineup({Key? key}) : super(key: key);

  @override
  State<PlayerLineup> createState() => _PlayerLineupState();
}

class _PlayerLineupState extends State<PlayerLineup> {
  final List<Player> players = playersList;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.5,
      ),
      children: List.generate(players.length, (index) {
        return Row(
          children: [
            const CheckBoxPlayer(),
            Text(
              players[index].name,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }),
    );
  }
}

class CheckBoxPlayer extends StatefulWidget {
  const CheckBoxPlayer({Key? key}) : super(key: key);

  @override
  State<CheckBoxPlayer> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<CheckBoxPlayer> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.all(greenTheme.primaryColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
