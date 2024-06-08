import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/controllers/new_player_controller.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/ui/pages/confirm_new_player_page.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/pages/player_overall_page.dart';
import 'package:team_draw/modules/new_player/ui/pages/player_strengths_page.dart';
import 'package:team_draw/modules/new_player/ui/pages/player_weak_points_page.dart';
import 'package:team_draw/modules/new_player/ui/pages/player_name_page.dart';
import 'package:team_draw/modules/new_player/ui/pages/player_principal_position_page.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_and_arrows_component.dart';
import 'package:team_draw/shared/ui/component/forward_button_component.dart';
import 'package:team_draw/shared/ui/component/page_index_animation_component.dart';

class NewPlayerNavBar extends StatefulWidget {
  final Player player;

  const NewPlayerNavBar({super.key, required this.player});

  @override
  State<NewPlayerNavBar> createState() => _NewPlayerNavBarState();
}

class _NewPlayerNavBarState extends State<NewPlayerNavBar> {
  final _navigator = Modular.get<NewPlayerRouteNavigator>();
  final _controller = Modular.get<NewPlayerController>();
  final _pageViewController = Modular.get<PageViewController>();
  late final Function(NewPlayerPageView) goToNextPageView;

  @override
  void initState() {
    super.initState();
    goToNextPageView = (NewPlayerPageView newPlayerPageViewEnum) {
      if (_isLastPageView(newPlayerPageViewEnum)) {
        _savePlayerAndGoToSuccessView();
      } else {
        _gotoNextPageView(newPlayerPageViewEnum);
      }
    };
    _controller.findAllPlayers();
  }

  void _gotoNextPageView(NewPlayerPageView newPlayerPageViewEnum) {
    _pageViewController.animateToPage(newPlayerPageViewEnum.pageIndex);
  }

  void _savePlayerAndGoToSuccessView() {
    _controller.savePlayer(widget.player).then((_) => _controller
            .calculatePlayerScore()
            .then((playersScore) => _goToSuccessView(playersScore))
            .then((_) async {
          await Future.delayed(const Duration(seconds: 1));
          _pageViewController.changeCurrentPageIndex(0);
        }));
  }

  Future<void> _goToSuccessView(List<PlayerScore> playersScore) {
    return _navigator.goTo(
        '$newPlayerRote$successNewPlayerRote', {"playersScore": playersScore});
  }

  bool _isLastPageView(NewPlayerPageView newPlayerPageViewEnum) {
    return NewPlayerPageView.finish == newPlayerPageViewEnum;
  }

  void _goToPreviousPage() {
    if (_pageViewController.isFirstPage()) {
      _navigator.goTo('$homeNavBarRoute/', null);
    } else {
      _pageViewController.previousPage();
    }
  }

  List<Widget> _allPagesView() {
    List<Widget> allPages = [
      PlayerNamePage(
        player: widget.player,
        goToNextPageView: goToNextPageView,
        allPlayers: _controller.allPlayers,
      ),
      PlayerPrincipalPositionPage(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      PlayerStrengthsPage(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      PlayerWeakPointsPage(
        player: widget.player,
        goToNextPageVIew: goToNextPageView,
      ),
      PlayerOverallPage(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      ConfirmNewPlayerPage(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      )
    ];
    assert(NewPlayerPageView.getTotalPages() == allPages.length);
    return allPages;
  }

  bool _isShowForwardButton() {
    return _pageViewController.currentPageIndex ==
            NewPlayerPageView.strengths.pageIndex ||
        _pageViewController.currentPageIndex ==
            NewPlayerPageView.weakPoints.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarTittleAndArrowsComponent(
        tittle: newPLayer,
        onBackAction: () => _goToPreviousPage(),
        forwardButtonAction: <Widget>[
          Observer(
            builder: (_) => ForwardButtonComponent(
              onPressed: () => _pageViewController.animateToNextPage(),
              isShowButton: _isShowForwardButton(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 64, bottom: 32.0),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => _controller.allPlayers == null
                    ? const Center(child: CircularProgressIndicator())
                    : PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageViewController.pageController,
                        children: _allPagesView(),
                      ),
              ),
            ),
            Observer(
              builder: (_) => PageIndexAnimationComponent(
                  pagesLength: _allPagesView().length,
                  currentPageIndex: _pageViewController.currentPageIndex,
                  animationPath: 'assets/animations/ball.json'),
            ),
          ],
        ),
      ),
    );
  }
}
