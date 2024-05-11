import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_match/helper/new_match_page_view.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/draw_teams_view.dart';
import 'package:team_draw/modules/new_match/view/match_settings/match_settings_view.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/players_lineup_view.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_base_view_model.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/app_bar_tittle_and_arrows_component.dart';
import 'package:team_draw/shared/view/component/forward_button_component.dart';
import 'package:team_draw/shared/view/component/page_index_animation_component.dart';

class NewMatchBaseView extends StatefulWidget {
  const NewMatchBaseView({super.key});

  @override
  State<NewMatchBaseView> createState() => _NewMatchBaseViewState();
}

class _NewMatchBaseViewState extends State<NewMatchBaseView> {
  final NewMatchRoteNavigator navigator = Modular.get<NewMatchRoteNavigator>();
  final PageViewController pageViewController =
      Modular.get<PageViewController>();
  final NewMatchBaseViewModel viewModel = Modular.get<NewMatchBaseViewModel>();
  final Map<Player, bool> selectedPlayers = {};
  final MatchSettings matchSettings = MatchSettings();
  late final Function(bool) _onShowForwardButton;

  @override
  void initState() {
    super.initState();
    _onShowForwardButton = (isShowForwardButton) {
      viewModel.showForwardButton(isShowForwardButton);
    };
  }

  List<Widget> allPagesView() {
    List<Widget> allPages = [
      PlayersLineupView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
        onShowForwardButton: _onShowForwardButton,
      ),
      MatchSettingsView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
      ),
      DrawnTeamsView(
        selectedPlayers: selectedPlayers,
        matchSettings: matchSettings,
        onShowForwardButton: _onShowForwardButton,
      ),
    ];
    assert(NewMatchPageView.getTotalPages() == allPages.length);
    return allPages;
  }

  void _goToPreviousPage() {
    if (pageViewController.isFirstPage()) {
      navigator.goTo('$homeNavBarRoute/', null);
    } else {
      pageViewController.previousPage();
      viewModel.showForwardButton(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          if (!pageViewController.isFirstPage()) {
            pageViewController.previousPage();
          }
        } else if (details.primaryVelocity! < 0) {
          pageViewController.animateToNextPage();
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
                onPressed: () => pageViewController.animateToNextPage(),
                isShowButton: viewModel.isShowForwardButton,
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
                  controller: pageViewController.pageController,
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
                        currentPageIndex: pageViewController.currentPageIndex,
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
