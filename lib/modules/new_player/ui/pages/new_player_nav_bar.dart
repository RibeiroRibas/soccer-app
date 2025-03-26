import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/modules/new_player/controllers/new_player_controller.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/ui/pages/page_views/confirm_new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/pages/page_views/player_name_page_view.dart';
import 'package:team_draw/modules/new_player/ui/pages/page_views/player_overall_page_view.dart';
import 'package:team_draw/modules/new_player/ui/pages/page_views/player_position_page_view.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/commom/scaffold_body_content.dart';
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
  late final Function(NewPlayerPageView) _goToNextPageView;
  late final Function(bool) _onShowForwardButton;

  @override
  void initState() {
    super.initState();
    _goToNextPageView = (NewPlayerPageView newPlayerPageViewEnum) {
      if (_isLastPageView(newPlayerPageViewEnum)) {
        _savePlayerAndGoToPlayersPage();
      } else {
        if (widget.player.name != null && widget.player.name!.isEmpty) return;
        _gotoNextPageView(newPlayerPageViewEnum);
      }
    };

    _onShowForwardButton = (isShowForwardButton) {
      _controller.canShowForwardButton = isShowForwardButton;
    };

    _controller.findAllPlayers();
    _controller.canShowForwardButton = _isUpdatePlayer();
  }

  bool _isUpdatePlayer() => widget.player.id > 0;

  void _gotoNextPageView(NewPlayerPageView newPlayerPageViewEnum) {
    _pageViewController.animateToPage(newPlayerPageViewEnum.pageIndex);
  }

  void _savePlayerAndGoToPlayersPage() {
    _controller.savePlayer(widget.player).then((_) => _controller
            .calculatePlayerScore()
            .then((playersScore) => _goToPlayersPage(playersScore))
            .then((_) async {
          await Future.delayed(const Duration(seconds: 1));
          _pageViewController.changeCurrentPageIndex(0);
        }));
  }

  Future<void> _goToPlayersPage(List<PlayerScore> playersScore) {
    return _navigator.goTo('$newPlayerRote$successNewPlayerRote',
        arguments: {"playersScore": playersScore});
  }

  bool _isLastPageView(NewPlayerPageView newPlayerPageViewEnum) {
    return NewPlayerPageView.finish == newPlayerPageViewEnum;
  }

  void _goToPreviousPage() {
    if (_pageViewController.isFirstPage()) {
      _navigator.goTo('$homeNavBarRoute/');
    } else {
      _pageViewController.previousPage();
    }
  }

  List<Widget> _allPagesView() {
    List<Widget> allPages = [
      PlayerNamePageView(
        player: widget.player,
        goToNextPageView: _goToNextPageView,
        allPlayers: _controller.allPlayers,
        canGoToNextPage: _onShowForwardButton,
      ),
      PlayerPositionPageView(
        player: widget.player,
        goToNextPageView: _goToNextPageView,
      ),
      PlayerOverallPageView(
        player: widget.player,
        goToNextPageView: _goToNextPageView,
      ),
      ConfirmNewPlayerPageView(
        player: widget.player,
        goToNextPageView: _goToNextPageView,
      )
    ];
    assert(NewPlayerPageView.getTotalPages() == allPages.length);
    return allPages;
  }

  bool _isShowForwardButton() {
    int currentPageIndex = _pageViewController.currentPageIndex;
    return currentPageIndex == NewPlayerPageView.name.pageIndex &&
            widget.player.name != null ||
        currentPageIndex == NewPlayerPageView.principalPosition.pageIndex &&
            widget.player.principalPosition != null ||
        currentPageIndex == NewPlayerPageView.overall.pageIndex &&
            widget.player.overall != null;
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
              onPressed: () {
                if (_canGoToNextPageView()) {
                  _pageViewController.animateToNextPage();
                }
              },
              isShowButton:
                  _controller.canShowForwardButton && _isShowForwardButton(),
            ),
          ),
        ],
      ),
      body: ScaffoldBodyContent(
        child: Column(
          children: [
            const SizedBox(height: 50),
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

  bool _canGoToNextPageView() => widget.player.name!.isNotEmpty;
}
