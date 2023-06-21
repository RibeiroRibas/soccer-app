import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/state/player_state.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';

class NewPlayerView extends StatefulWidget {
  const NewPlayerView({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPlayerView> createState() => _NewPlayerViewState();
}

class _NewPlayerViewState extends State<NewPlayerView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();

  int index = 0;

  @override
  void initState() {
    super.initState();
    navigator.goTo('$newPlayerRote$nameRoute', null);
  }

  @override
  void didChangeDependencies() {
    reaction((_) => viewModel.state, (state) {
      if (state is SuccessPlayerState) {
        _showSnackBar();
        navigator.goTo(startRote, null);
      }
    });
    super.didChangeDependencies();
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ThemeColors.primary,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Text(
        "${viewModel.player.name!} $addNewPlayer",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ThemeColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
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
          onPressed: () {
            if (viewModel.changeBottomNavigationButtons) {
              viewModel.bottomNavigationWithTwoButtons();
            }
            navigator.backRouteFromIndex(index);
            index--;
          },
          icon: Icon(
            Icons.arrow_back,
            color: greenTheme.primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Observer(
          builder: (_) => Row(
            children: [
              Expanded(
                child: ElevatedButtonComponent(
                  onButtonPressed: () {
                    if (viewModel.canGoToNextView) {
                      viewModel.addPlayer();
                    } else {
                      viewModel.onButtonPressed!.call();
                    }
                  },
                  text: savePlayer,
                ),
              ),
              !viewModel.changeBottomNavigationButtons
                  ? Expanded(
                      child: ElevatedButtonComponent(
                        onButtonPressed: () {
                          if (index == 2) {
                            viewModel.bottomNavigationWithOneButton();
                          }
                          if (viewModel.canGoToNextView) {
                            navigator.nextRouteFromIndex(index);
                            index++;
                          } else {
                            viewModel.onButtonPressed!.call();
                          }
                        },
                        text: nextRecommended,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: RouterOutlet()),
            SizedBox(
              width: 175,
              height: 175,
              child: Lottie.asset('assets/animations/foot.json'),
            ),
          ],
        ),
      ),
    );
  }
}
