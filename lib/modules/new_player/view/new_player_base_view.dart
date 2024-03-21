import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class NewPlayerBaseView extends StatefulWidget {
  const NewPlayerBaseView({
    super.key,
  });

  @override
  State<NewPlayerBaseView> createState() => _NewPlayerBaseViewState();
}

class _NewPlayerBaseViewState extends State<NewPlayerBaseView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();
  late final void Function(int) onActionPress;
  final Player player = Player();

  @override
  void initState() {
    super.initState();
    onActionPress = (int index) => viewModel.changeCurrentView(index);
    autorun((_) => _goToNextView(viewModel.currentView));
  }

  void _goToNextView(int index) {
    Map<String, dynamic> arguments = {
      "player": player,
      "onActionPress": onActionPress,
    };
    navigator.nextRouteFromIndex(index, arguments);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNodeHelper.dismissKeyboard(context),
      child: GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              newPLayer,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => viewModel.changeCurrentView(-1),
              icon: Icon(
                Icons.arrow_back,
                color: greenTheme.primaryColor,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 64, bottom: 32.0),
            child: Column(
              children: [
                const Expanded(child: RouterOutlet()),
                Observer(
                  builder: (BuildContext context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int index = 0; index < 5; index++) ...{
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5.5,
                                height: 100,
                                child: viewModel.currentView == index
                                    ? Lottie.asset(
                                        'assets/animations/ball.json')
                                    : null,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width / 5) / 4,
                                height: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: viewModel.currentView == index
                                        ? ThemeColors.primary
                                        : ThemeColors.table),
                              ),
                            ],
                          ),
                        },
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
