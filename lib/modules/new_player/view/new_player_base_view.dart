import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/confirm_new_player_view.dart';
import 'package:team_draw/modules/new_player/view/overall/player_overall_view.dart';
import 'package:team_draw/modules/new_player/view/player_name_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_principal_position_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_secondary_position_view.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/page_index_animation_component.dart';

class NewPlayerBaseView extends StatefulWidget {
  const NewPlayerBaseView({
    super.key,
  });

  @override
  State<NewPlayerBaseView> createState() => _NewPlayerBaseViewState();
}

class _NewPlayerBaseViewState extends State<NewPlayerBaseView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  final PlayerViewModel controller = Modular.get<PlayerViewModel>();
  late PageController pageViewController;
  late final void Function(int) onActionPress;
  final Player player = Player();

  @override
  void initState() {
    super.initState();
    pageViewController =
        PageController(initialPage: controller.currentPageIndex);
    onActionPress = (int index) {
      if (_isLastIndex(index)) {
        _savePlayerAndGoToSuccessView();
      } else {
        _gotoNextPageView(index);
      }
    };
    _findAllPLayers();
  }

  void _gotoNextPageView(int index) {
    controller.changeCurrentPageIndex(index);
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  void _savePlayerAndGoToSuccessView() {
    controller.savePlayer(player).then((_) => controller
            .calculatePlayerScore()
            .then((playersScore) => _goToSuccessView(playersScore))
            .then((_) async {
          await Future.delayed(const Duration(seconds: 1));
          controller.changeCurrentPageIndex(0);
        }));
  }

  Future<void> _goToSuccessView(List<PlayerScore> playersScore) {
    return navigator.goTo(
        '$newPlayerRote$successNewPlayerRote', {"playersScore": playersScore});
  }

  Future<void> _findAllPLayers() async {
    await controller.findAllPlayers();
  }

  bool _isLastIndex(int index) {
    return allPagesView().length == (index);
  }

  void _goToPreviousPage() {
    controller.changeCurrentPageIndex(-1);
    if (controller.currentPageIndex == -1) {
      navigator.goTo('$homeNavBarRoute/', null);
    } else {
      pageViewController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  List<Widget> allPagesView() {
    return [
      PlayerNameView(
        player: player,
        onActionPress: onActionPress,
        allPlayers: controller.allPlayers,
      ),
      PlayerPrincipalPositionView(
        player: player,
        onActionPress: onActionPress,
      ),
      PlayerSecondaryPositionView(
        player: player,
        onActionPress: onActionPress,
      ),
      PlayerOverallView(
        player: player,
        onActionPress: onActionPress,
      ),
      ConfirmNewPlayerView(
        player: player,
        onActionPress: onActionPress,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          newPLayer,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => _goToPreviousPage(),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
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
                        controller: pageViewController,
                        children: allPagesView(),
                      ),
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return PageIndexAnimationComponent(
                    pagesLength: allPagesView().length,
                    currentPageIndex: controller.currentPageIndex,
                    animationPath: 'assets/animations/ball.json');
              },
            ),
          ],
        ),
      ),
    );
  }
}
