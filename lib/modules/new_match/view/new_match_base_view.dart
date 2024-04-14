import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/draw_teams_view.dart';
import 'package:team_draw/modules/new_match/view/match_settings/match_settings_view.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/players_lineup_view.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/page_index_animation_component.dart';

class NewMatchBaseView extends StatefulWidget {
  const NewMatchBaseView({super.key});

  @override
  State<NewMatchBaseView> createState() => _NewMatchBaseViewState();
}

class _NewMatchBaseViewState extends State<NewMatchBaseView> {
  final NewMatchRoteNavigator navigator = Modular.get<NewMatchRoteNavigator>();
  final NewMatchViewModel controller = Modular.get<NewMatchViewModel>();
  late PageController pageViewController;
  final Map<Player, bool> selectedPlayers = {};
  final MatchSettings matchSettings = MatchSettings();

  @override
  void initState() {
    super.initState();
    pageViewController =
        PageController(initialPage: controller.currentPageIndex);
  }

  List<Widget> allPagesView() => [
        PlayersLineupView(
          selectedPlayers: selectedPlayers,
          matchSettings: matchSettings,
        ),
        MatchSettingsView(
          selectedPlayers: selectedPlayers,
          matchSettings: matchSettings,
        ),
        DrawnTeamsView(
          selectedPlayers: selectedPlayers,
          matchSettings: matchSettings,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          controller.changeCurrentPageIndex(-1);
        } else if (details.primaryVelocity! < 0) {
          controller.changeCurrentPageIndex(1);
        }
      },
      onTap: () => FocusNodeHelper.dismissKeyboard(context),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            newMatchTittle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              controller.changeCurrentPageIndex(-1);
              if (controller.currentPageIndex == -1) {
                navigator.goTo('$homeNavBarRoute/', null);
              } else {
                pageViewController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              }
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                controller.changeCurrentPageIndex(1);
                pageViewController.animateToPage(
                  controller.currentPageIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              icon: Icon(
                Icons.arrow_forward,
                weight: 0.5,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageViewController,
                  children: allPagesView(),
                ),
              ),
              Observer(
                builder: (BuildContext context) {
                  return PageIndexAnimationComponent(
                      pagesLength: allPagesView().length,
                      currentPageIndex: controller.currentPageIndex,
                      animationPath: 'assets/animations/foot.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
