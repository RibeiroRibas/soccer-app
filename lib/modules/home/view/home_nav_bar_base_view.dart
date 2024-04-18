import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/helper/home_page_view.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view/expandable_fab/action_button_widget.dart';
import 'package:team_draw/modules/home/view/expandable_fab/expandable_fab_widget.dart';
import 'package:team_draw/modules/home/view/home_view.dart';
import 'package:team_draw/modules/home/view/players/players_view.dart';
import 'package:team_draw/modules/home/view/teams_view.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class HomeNavBarBaseView extends StatefulWidget {
  const HomeNavBarBaseView({super.key});

  @override
  State<HomeNavBarBaseView> createState() => _HomeNavBarBaseViewState();
}

class _HomeNavBarBaseViewState extends State<HomeNavBarBaseView> {
  final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();
  final HomeViewModel controller = Modular.get<HomeViewModel>();
  late PageViewController pageViewController =
      Modular.get<PageViewController>();

  @override
  void initState() {
    super.initState();
    controller.findAllData();
  }

  List<Widget> allPagesView() {
    List<Widget> allPages = [
      HomeView(
        teamsScore: controller.calculateTeamScore(),
        allMatches: controller.allMatches,
      ),
      TeamsView(
        teams: controller.teams,
        allMatches: controller.allMatches,
      ),
      PlayersView(playersScore: controller.calculatePlayerScore())
    ];
    assert(HomePageView.getTotalPages() == allPages.length);
    return allPages;
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => navigator.goTo(selectThemeRoute, null),
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
          currentIndex: pageViewController.currentPageIndex,
          onTap: (index) => pageViewController.animateToPage(index),
        ),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                child: PageView(
                  controller: pageViewController.pageController,
                  children: allPagesView(),
                  onPageChanged: (index) =>
                      pageViewController.changeCurrentPageIndex(index),
                )),
      ),
    );
  }
}
