import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/new_match/helper/new_match_page_view.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/ui/pages/page_views/draw_teams_page_view.dart';
import 'package:team_draw/modules/new_match/ui/pages/page_views/match_settings_page_view.dart';
import 'package:team_draw/modules/new_match/ui/pages/page_views/players_lineup_page_view.dart';
import 'package:team_draw/modules/new_match/controllers/new_match_nav_bar_controller.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_and_arrows_component.dart';
import 'package:team_draw/shared/ui/component/forward_button_component.dart';
import 'package:team_draw/shared/ui/component/page_index_animation_component.dart';

class NewMatchNavBar extends StatefulWidget {
  const NewMatchNavBar({super.key});

  @override
  State<NewMatchNavBar> createState() => _NewMatchNavBarState();
}

class _NewMatchNavBarState extends State<NewMatchNavBar> {
  final _navigator = Modular.get<NewMatchRoteNavigator>();
  final _pageViewController = Modular.get<PageViewController>();
  final _controller = Modular.get<NewMatchNavBarController>();

  final Map<Player, bool> selectedPlayers = {};
  final MatchSettings matchSettings = MatchSettings();
  late final Function(bool) _onShowForwardButton;

  @override
  void initState() {
    super.initState();
    _onShowForwardButton = (isShowForwardButton) {
      _controller.showForwardButton(isShowForwardButton);
    };
  }

  List<Widget> allPagesView() {
    List<Widget> allPages = [
      PlayersLineupPageView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
        onShowForwardButton: _onShowForwardButton,
      ),
      MatchSettingsPageView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
        onShowForwardButton: _onShowForwardButton,
      ),
      DrawnTeamsPageView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
        onShowForwardButton: _onShowForwardButton,
      ),
    ];
    assert(NewMatchPageView.getTotalPages() == allPages.length);
    return allPages;
  }

  void _goToPreviousPage() {
    if (_pageViewController.isFirstPage()) {
      _navigator.goTo('$homeNavBarRoute/');
    } else {
      _pageViewController.previousPage();
      _controller.showForwardButton(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          if (!_pageViewController.isFirstPage()) {
            _pageViewController.previousPage();
          }
        } else if (details.primaryVelocity! < 0) {
          _pageViewController.animateToNextPage();
        }
      },
      onTap: () => FocusNodeHelper.dismissKeyboard(context),
      child: Scaffold(
        extendBody: true,
        appBar: AppBarTittleAndArrowsComponent(
          tittle: newMatch,
          onBackAction: () => _goToPreviousPage(),
          forwardButtonAction: <Widget>[
            Observer(
              builder: (_) => ForwardButtonComponent(
                onPressed: () => _pageViewController.animateToNextPage(),
                isShowButton: _controller.isShowForwardButton,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageViewController.pageController,
                  children: allPagesView(),
                ),
              ),
              Observer(
                builder: (BuildContext context) {
                  return Positioned(
                    bottom: 20.0,
                    left: 0.0,
                    right: 0.0,
                    child: PageIndexAnimationComponent(
                        pagesLength: allPagesView().length,
                        currentPageIndex: _pageViewController.currentPageIndex,
                        animationPath: 'assets/animations/foot.json'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
