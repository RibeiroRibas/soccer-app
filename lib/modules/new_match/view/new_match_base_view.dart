import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class NewMatchBaseView extends StatefulWidget {
  const NewMatchBaseView({super.key});

  @override
  State<NewMatchBaseView> createState() => _NewMatchBaseViewState();
}

class _NewMatchBaseViewState extends State<NewMatchBaseView> {
  final NewMatchRoteNavigator navigator = Modular.get<NewMatchRoteNavigator>();
  final NewMatchViewModel viewModel = Modular.get<NewMatchViewModel>();
  final Map<Player, bool> selectedPlayers = {};
  final MatchSettings matchSettings = MatchSettings();

  @override
  void initState() {
    super.initState();
    autorun((_) => _goToNextView(viewModel.currentView));
  }

  Future _goToNextView(int index) async {
    Map<String, dynamic> arguments = {
      "selectedPlayers": selectedPlayers,
      "matchSettings": matchSettings,
    };
    navigator.nextRouteFromIndex(index, arguments);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          viewModel.changeCurrentView(-1);
        } else if (details.primaryVelocity! < 0) {
          viewModel.changeCurrentView(1);
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
              viewModel.changeCurrentView(-1);
            },
            icon: Icon(
              Icons.arrow_back,
              color: greenTheme.primaryColor,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                viewModel.changeCurrentView(1);
              },
              icon: Icon(
                Icons.arrow_forward,
                weight: 0.5,
                color: greenTheme.primaryColor,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const Expanded(child: RouterOutlet()),
              Container(
                color: greenTheme.scaffoldBackgroundColor,
                child: Observer(
                  builder: (BuildContext context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int index = 0; index < 4; index++) ...{
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                height: 100,
                                child: viewModel.currentView == index
                                    ? Lottie.asset(
                                        'assets/animations/foot.json')
                                    : null,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width / 4) / 3,
                                height: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: viewModel.currentView == index
                                        ? ThemeColors.primary
                                        : ThemeColors.table),
                              ),
                              const SizedBox(height: 32)
                            ],
                          ),
                        },
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
