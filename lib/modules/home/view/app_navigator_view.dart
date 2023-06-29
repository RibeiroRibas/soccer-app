import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_rote_navigator.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class AppNavigatorView extends StatelessWidget {
  const AppNavigatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppNavigatorRoutes navigator = Modular.get<AppNavigatorRoutes>();
    final HomeViewModel controller = Modular.get<HomeViewModel>();

    void goToHomeView() {
      Map<String, dynamic> arguments = {
        "teamsScore": controller.calculateTeamScore(),
        "allMatches": controller.allMatches,
      };
      navigator.goTo(homeRoute, arguments);
    }

    goToTeamsView() {
      Map<String, dynamic> arguments = {
        "teamsOverall": controller.calculateTeamOverall(),
        "allMatches": controller.allMatches,
      };
      navigator.goTo(teamsRoute, arguments);
    }

    goToPlayersView() {
      Map<String, dynamic> arguments = {
        "playersScore": controller.calculatePlayerScore()
      };
      navigator.goTo(playersRoute, arguments);
    }

    controller.findAllData().then((_) => goToHomeView());

    return GestureDetector(
      onTap: () {
        FocusNodeHelper.dismissKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appName,
            style: greenTheme.textTheme.displayLarge,
          ),
          centerTitle: true,
        ),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigator.goTo('$newMatchRote/', null),
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
      ),
    );
  }
}
