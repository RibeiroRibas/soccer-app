import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

import '../../shared/theme/green_theme.dart';
import '../component/text_with_border_component.dart';
import '../view/team_list_view.dart';

class AppNavigatorLayout extends StatefulWidget {
  const AppNavigatorLayout({Key? key}) : super(key: key);

  @override
  State<AppNavigatorLayout> createState() => _AppNavigatorLayoutState();
}

class _AppNavigatorLayoutState extends State<AppNavigatorLayout> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [TeamListView(), TeamListView(),TeamListView()];

    return Scaffold(
      appBar: AppBar(
        title: TextWithBorderComponent(
          text: appName,
          textStyle: greenTheme.textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
