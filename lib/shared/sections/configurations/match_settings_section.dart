import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/box_card.dart';
import 'package:team_draw/shared/section_tittle.dart';

class MatchSettingsSection extends StatelessWidget {
  const MatchSettingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SectionTittle(
            tittle: "Confidurações da Partida",
            icon: Icons.settings,
          ),
          BoxCard(
            boxCardBody: Text("alo"),
            height: 170,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("")
          ],
        )
      ],
    );
  }
}
