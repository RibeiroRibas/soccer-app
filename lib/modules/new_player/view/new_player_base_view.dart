import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/confirm/confirm_new_player_view.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/view/overall/player_overall_view.dart';
import 'package:team_draw/modules/new_player/view/player_characteristics/player_strengths_view.dart';
import 'package:team_draw/modules/new_player/view/player_characteristics/player_weak_points_view.dart';
import 'package:team_draw/modules/new_player/view/player_name_view.dart';
import 'package:team_draw/modules/new_player/view/player_characteristics/player_principal_position_view.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/app_bar_tittle_and_arrows_component.dart';
import 'package:team_draw/shared/view/component/forward_button_component.dart';
import 'package:team_draw/shared/view/component/page_index_animation_component.dart';

class NewPlayerBaseView extends StatefulWidget {
  final Player player;

  const NewPlayerBaseView({super.key, required this.player});

  @override
  State<NewPlayerBaseView> createState() => _NewPlayerBaseViewState();
}

class _NewPlayerBaseViewState extends State<NewPlayerBaseView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  final PlayerViewModel controller = Modular.get<PlayerViewModel>();
  final PageViewController pageViewController =
      Modular.get<PageViewController>();
  late final void Function(NewPlayerPageView) goToNextPageView;

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
    _findAllPLayers();
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
              onPressed: () => pageViewController.animateToNextPage(),
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
                builder: (_) => controller.allPlayers == null
                    ? const Center(child: CircularProgressIndicator())
                    : PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageViewController.pageController,
                        children: _allPagesView(),
                      ),
              ),
            ),
            Observer(
              builder: (_) => PageIndexAnimationComponent(
                  pagesLength: _allPagesView().length,
                  currentPageIndex: pageViewController.currentPageIndex,
                  animationPath: 'assets/animations/ball.json'),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoNextPageView(NewPlayerPageView newPlayerPageViewEnum) {
    pageViewController.animateToPage(newPlayerPageViewEnum.pageIndex);
  }

  void _savePlayerAndGoToSuccessView() {
    controller.savePlayer(widget.player).then((_) => controller
            .calculatePlayerScore()
            .then((playersScore) => _goToSuccessView(playersScore))
            .then((_) async {
          await Future.delayed(const Duration(seconds: 1));
          pageViewController.changeCurrentPageIndex(0);
        }));
  }

  Future<void> _goToSuccessView(List<PlayerScore> playersScore) {
    return navigator.goTo(
        '$newPlayerRote$successNewPlayerRote', {"playersScore": playersScore});
  }

  Future<void> _findAllPLayers() async {
    await controller.findAllPlayers();
  }

  bool _isLastPageView(NewPlayerPageView newPlayerPageViewEnum) {
    return NewPlayerPageView.finish == newPlayerPageViewEnum;
  }

  void _goToPreviousPage() {
    if (pageViewController.isFirstPage()) {
      navigator.goTo('$homeNavBarRoute/', null);
    } else {
      pageViewController.previousPage();
    }
  }

  List<Widget> _allPagesView() {
    List<Widget> allPages = [
      PlayerNameView(
        player: widget.player,
        goToNextPageView: goToNextPageView,
        allPlayers: controller.allPlayers,
      ),
      PlayerPrincipalPositionView(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      PlayerStrengthsView(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      PlayerWeakPointsView(
        player: widget.player,
        goToNextPageVIew: goToNextPageView,
      ),
      PlayerOverallView(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      ),
      ConfirmNewPlayerView(
        player: widget.player,
        goToNextPageView: goToNextPageView,
      )
    ];
    assert(NewPlayerPageView.getTotalPages() == allPages.length);
    return allPages;
  }

  bool _isShowForwardButton() {
    return pageViewController.currentPageIndex ==
            NewPlayerPageView.strengths.pageIndex ||
        pageViewController.currentPageIndex ==
            NewPlayerPageView.weakPoints.pageIndex;
  }
}
