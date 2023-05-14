import 'package:flutter/material.dart';
import 'package:team_draw/components/sections/configurations/match_settings_section.dart';
import 'package:team_draw/components/sections/matches/history_matches.dart';
import 'package:team_draw/components/sections/players/player_lineup.dart';
import 'package:team_draw/components/sections/teams/teams_section.dart';

import '../components/main_drawer.dart';
import '../components/sections/players/players_section.dart';
import '../themes/green_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Football App'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_1),
            label: 'Partida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Times',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
        selectedItemColor: greenTheme.primaryColor,
        onTap: (index) {
          setState(() {});
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Players(),
            TeamsSection(),
            HistoryMatches(),
            MatchSettingsSection(),
          ],
        ),
      ),
    );
  }
}
