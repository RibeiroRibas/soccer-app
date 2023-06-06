import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/section/team_versus_section.dart';

import '../../shared/theme/green_theme.dart';
import '../view/app_navigator/home_view.dart';
import '../view/app_navigator/team_list_view.dart';

class AppNavigatorLayout extends StatefulWidget {
  const AppNavigatorLayout({Key? key}) : super(key: key);

  @override
  State<AppNavigatorLayout> createState() => _AppNavigatorLayoutState();
}

class _AppNavigatorLayoutState extends State<AppNavigatorLayout> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeView(),
      TeamView(),
      TeamsVersusSection(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: greenTheme.textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: home,
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
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      body: pages.elementAt(_currentPage),
      //   const TeamView(),
    );
  }
}
