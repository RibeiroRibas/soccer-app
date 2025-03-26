import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/controllers/home_controller.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/modules/home/ui/components/drawer_menu_component.dart';
import 'package:team_draw/modules/home/ui/dialogs/confirm_delete_player_dialog.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/action_button_component.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/expandable_fab_section.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/home_page_view.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/players_page_view.dart';
import 'package:team_draw/modules/home/ui/pages/page_views/teams_page_view.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/commom/scaffold_body_content.dart';

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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.findAllData();
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
      drawer: const Drawer(width: 200, child: DrawerMenuComponent()),
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
          builder: (_) => _BottomNavigationBarComponent(
              currentIndex: _pageViewController.currentPageIndex,
              onTabTap: (index) => _pageViewController.animateToPage(index))),
      body: Observer(
        builder: (_) => _controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ScaffoldBodyContent(
                child: PageView(
                  controller: _pageViewController.pageController,
                  children: allPagesView(),
                  onPageChanged: (index) =>
                      _pageViewController.changeCurrentPageIndex(index),
                ),
              ),
      ),
    );
  }

  Future<bool> _showConfirmDeletePlayerDialog(Player player) async {
    bool canDeletePlayer = false;
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ConfirmDeletePlayerDialog(
            message: '$confirmDeletePlayerTap ${player.name}?',
            onDeleteButtonTap: ()  {
              _controller.deletePlayer(player);
              _navigator.pop();
              canDeletePlayer =  true;
            },
            onCancelButtonTap: () {
              _navigator.pop();
              canDeletePlayer =  false;
            }));
    return canDeletePlayer;
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
      PlayersPageView(
        playersScore: _controller.calculatePlayerScore(),
        onDeletePlayerTap: _showConfirmDeletePlayerDialog,
      )
    ];
    return allPages;
  }
}

class _BottomNavigationBarComponent extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTap;

  const _BottomNavigationBarComponent(
      {required this.currentIndex, required this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: currentIndex,
      onTap: (index) => onTabTap(index),
    );
  }
}
