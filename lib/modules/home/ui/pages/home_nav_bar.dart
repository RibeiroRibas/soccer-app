import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/controllers/home_controller.dart';
import 'package:team_draw/modules/home/helper/home_page_view.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/action_button_component.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/expandable_fab_section.dart';
import 'package:team_draw/modules/home/ui/pages/drawer_menu.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/home_page_view.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/players_page_view.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/teams_page_view.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final _navigator = Modular.get<HomeRouteNavigator>();
  final _controller = Modular.get<HomeController>();
  final _pageViewController = Modular.get<PageViewController>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.findAllData();
  }

  List<Widget> allPagesView() {
    List<Widget> allPages = [
      HomePageView(
        teamsScore: _controller.calculateTeamScore(),
        allMatches: _controller.allMatches,
      ),
      TeamsPageView(
        teams: _controller.teams,
      ),
      PlayersPageView(playersScore: _controller.calculatePlayerScore())
    ];
    assert(HomePageViewHelper.getTotalPages() == allPages.length);
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
      drawer: const Drawer(width: 200, child: DrawerMenu()),
      floatingActionButton: ExpandableFabSection(
        distance: 80,
        children: [
          ActionButtonComponent(
            onPressed: () => _navigator
                .goTo('$newPlayerRote/', arguments: {"player": Player()}),
            icon: const Icon(Icons.person_add),
          ),
          ActionButtonComponent(
            onPressed: () => _navigator.goTo('$newMatchRote/'),
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
          currentIndex: _pageViewController.currentPageIndex,
          onTap: (index) => _pageViewController.animateToPage(index),
        ),
      ),
      body: Observer(
        builder: (_) => _controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                child: PageView(
                  controller: _pageViewController.pageController,
                  children: allPagesView(),
                  onPageChanged: (index) =>
                      _pageViewController.changeCurrentPageIndex(index),
                )),
      ),
    );
  }
}
