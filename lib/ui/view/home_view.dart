import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

import '../../shared/theme/green_theme.dart';
import '../component/text_with_border_component.dart';
import 'team_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWithBorderComponent(
          text: appName,
          textStyle: greenTheme.textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: history,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: teams,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: players,
          ),
        ],
        selectedItemColor: greenTheme.primaryColor,
        onTap: (index) {
          setState(() {});
        },
      ),
      body:
      // SingleChildScrollView(
      //   child:
      //   Padding(
      //     padding: const EdgeInsets.only(
      //       left: 12.0,
      //       right: 12.0,
      //       top: 8.0,
      //       bottom: 8.0,
      //     ),
      //     child:
      //     Column(
      //       children: <Widget>[
      //         TeamsVersusSection(enablePlayerChange: true),
      //         HistoryMatchesSection(),
      //       ],
      //     ),
      //   ),
      // ),
      const TeamView(),
    );
  }
}
