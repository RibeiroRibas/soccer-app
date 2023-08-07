import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/shared/helper/focus_node_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class NewMatchView extends StatefulWidget {
  const NewMatchView({Key? key}) : super(key: key);

  @override
  State<NewMatchView> createState() => _NewMatchViewState();
}

class _NewMatchViewState extends State<NewMatchView> {
  final NewMatchRoteNavigator navigator = Modular.get<NewMatchRoteNavigator>();
  final NewMatchViewModel viewModel = Modular.get<NewMatchViewModel>();
  late final void Function(int) onActionPress;
  late final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings = getMatchSettings;

  @override
  void initState() {
    super.initState();
    _findAllPlayers().then((_) => _goToNextView(viewModel.currentView));
    reaction((_) => viewModel.currentView,
        (currentView) => _goToNextView(currentView));
  }

  Future _findAllPlayers() async {
    selectedPlayers = await viewModel.findAllPlayers();
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
      onHorizontalDragEnd: (details){
        if(details.primaryVelocity! > 0){
          viewModel.changeCurrentView(-1);
        } else if (details.primaryVelocity! < 0){
          viewModel.changeCurrentView(1);
        }
      },
      onTap: () => FocusNodeHelper.dismissKeyboard(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 32, bottom: 32.0),
          child: Column(
            children: [
              const Expanded(child: RouterOutlet()),
              Observer(
                builder: (BuildContext context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int index = 0; index < 4; index++) ...{
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: 175,
                              child: viewModel.currentView == index
                                  ? Lottie.asset('assets/animations/foot.json')
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
    );
  }
}
