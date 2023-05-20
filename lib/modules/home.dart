import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/sections/history_match/history_matches_section.dart';
import 'package:team_draw/shared/sections/team_versus/team_versus_section.dart';

import '../shared/themes/green_theme.dart';

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
        title: const Text(appName),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_1),
            label: match,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: teams,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: history,
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
            TeamsVersusSection(),
            HistoryMatchesSection(),
          ],
        ),
      ),
    );
  }
}
