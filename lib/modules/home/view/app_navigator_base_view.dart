import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/app_navigator_routes.dart';
import 'package:team_draw/modules/home/view/expandable_fab/action_button_widget.dart';
import 'package:team_draw/modules/home/view/expandable_fab/expandable_fab_widget.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class AppNavigatorBaseView extends StatelessWidget {
  const AppNavigatorBaseView({super.key});

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
        "teams": controller.teams,
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
        floatingActionButton: ExpandableFabWidget(
          distance: 80,
          children: [
            ActionButtonWidget(
              onPressed: () => navigator.goTo('$newPlayerRote/', null),
              icon: const Icon(Icons.person_add),
            ),
            ActionButtonWidget(
              onPressed: () => navigator.goTo('$newMatchRote/', null),
              icon: const Icon(CustomIcons.soccerBall),
            ),
          ],
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
