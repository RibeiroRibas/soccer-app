import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:team_draw/modules/app_navigator/routes/app_navigator_rotes.dart';
import 'package:team_draw/modules/app_navigator/view_model/app_navigator_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/modules/app_navigator/routes/route_named.dart';

class AppNavigatorView extends StatelessWidget {
  const AppNavigatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppNavigatorRoutes delegate = Modular.get<AppNavigatorRoutes>();

    final AppNavigatorViewModel controller =
        Modular.get<AppNavigatorViewModel>();

    void goToHomeView() {
      Map<String, dynamic> arguments = {
        "teamsScore": controller.calculateTeamScore(),
        "allMatches": controller.allMatches,
      };
      delegate.goTo(homeRoute, arguments);
    }

    goToTeamsView() {
      Map<String, dynamic> arguments = {
        "teamsOverall": controller.calculateTeamOverall(),
        "allMatches": controller.allMatches,
      };
      delegate.goTo(teamsRoute, arguments);
    }

    goToPlayersView() {
      Map<String, dynamic> arguments = {
        "playersScore": controller.calculatePlayerScore()
      };
      delegate.goTo(playersRoute, arguments);
    }

    controller.findAllData().then((_) => goToHomeView());

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
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
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
          currentIndex: controller.currentPageIndex,
          onTap: (index) {
            controller.changeIndex(index);
            switch (index) {
              case 0:
                goToHomeView();
              case 1:
                goToTeamsView();
              case 2:
                goToPlayersView();
            }
          },
        ),
      ),
      body: const Padding(
          padding:
              EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
          child: RouterOutlet()),
    );
  }
}
