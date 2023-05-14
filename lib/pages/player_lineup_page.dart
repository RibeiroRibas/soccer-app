import 'package:flutter/material.dart';

import '../components/box_card.dart';
import '../components/section_tittle.dart';
import '../models/player.dart';
import '../players_data.dart';
import '../themes/green_theme.dart';

class PlayerLineupPage extends StatefulWidget {
  const PlayerLineupPage({Key? key}) : super(key: key);

  @override
  State<PlayerLineupPage> createState() => _PlayerLineupPageState();
}

class _PlayerLineupPageState extends State<PlayerLineupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCALAÇÃO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SectionTittle(
              tittle: "Selecione os Jogadores",
              icon: Icons.person_add,
            ),
            BoxCard(
              boxCardBody: _PlayerLineup(),
              height: 500,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width,
                  40,
                ),
              )),
              child: const Text("SORTEAR EQUIPES"),
            )
          ],
        ),
      ),
    );
  }
}

class _PlayerLineup extends StatelessWidget {
  const _PlayerLineup({Key? key}) : super(key: key);

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
              const _CheckBoxPlayer(),
              Text(
                players[index].name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _CheckBoxPlayer extends StatefulWidget {
  const _CheckBoxPlayer({Key? key}) : super(key: key);

  @override
  State<_CheckBoxPlayer> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<_CheckBoxPlayer> {
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
