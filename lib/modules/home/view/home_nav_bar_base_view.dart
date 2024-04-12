import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view/expandable_fab/action_button_widget.dart';
import 'package:team_draw/modules/home/view/expandable_fab/expandable_fab_widget.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class HomeNavBarBaseView extends StatelessWidget {
  const HomeNavBarBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();
    final HomeViewModel controller = Modular.get<HomeViewModel>();

    void goToHomeView(int index) {
      Map<String, dynamic> arguments = {
        "teamsScore": controller.calculateTeamScore(),
        "allMatches": controller.allMatches,
      };
      navigator.nextRouteFromIndex(index, arguments);
    }

    goToTeamsView(int index) {
      Map<String, dynamic> arguments = {
        "teams": controller.teams,
        "allMatches": controller.allMatches,
      };
      navigator.nextRouteFromIndex(index, arguments);
    }

    goToPlayersView(int index) {
      Map<String, dynamic> arguments = {
        "playersScore": controller.calculatePlayerScore()
      };
      navigator.nextRouteFromIndex(index, arguments);
    }

    controller.findAllData().then((_) => goToHomeView(0));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: TextButton(
            onPressed: () {
              Modular.to.popUntil(
                  ModalRoute.withName(Modular.to.navigateHistory.first.name));
              Modular.to.popUntil(
                  ModalRoute.withName(Modular.to.navigateHistory.first.name));
              //Modular.to.navigate("/redirect");
            },
            child: Text(
              "Temas",
              style: Theme.of(context).textTheme.bodyMedium,
            )),
      ),
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
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: controller.currentPageIndex,
          onTap: (index) {
            controller.changeIndex(index);
            switch (index) {
              case 0:
                goToHomeView(index);
              case 1:
                goToTeamsView(index);
              case 2:
                goToPlayersView(index);
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
