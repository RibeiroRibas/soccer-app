import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/player_check_box_widget.dart';
import 'package:team_draw/modules/new_match/view_model/player_lineup_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/view/section/tittle_section.dart';

class PlayersLineupView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const PlayersLineupView({
    super.key,
    required this.selectedPlayers,
    required this.matchSettings,
    required this.onShowForwardButton,
  });

  @override
  State<PlayersLineupView> createState() => _PlayersLineupViewState();
}

class _PlayersLineupViewState extends State<PlayersLineupView> {
  final PlayerLineupViewModel viewModel = Modular.get<PlayerLineupViewModel>();
  final NewMatchRoteNavigator navigator = Modular.get<NewMatchRoteNavigator>();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _findAllPlayers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction((_) => viewModel.selectedPlayers,
        (Map<Player, bool> selectedPlayers) {
      onShowForwardButton();
      widget.selectedPlayers.clear();
      widget.selectedPlayers.addAll(selectedPlayers);
    });
  }

  Future<void> _findAllPlayers() async {
    await viewModel.findAndSetAllPlayers(widget.selectedPlayers);
  }

  void onShowForwardButton() {
    Iterable<bool> selectedPlayers = widget.selectedPlayers.values
        .map((isSelected) => isSelected)
        .where((element) => element);
    if (selectedPlayers.length > 1) {
      widget.onShowForwardButton(true);
    } else {
      widget.onShowForwardButton(false);
    }
  }

  void _onSelectedPlayer(Player selectedPlayer) {
    if (widget.selectedPlayers[selectedPlayer] == true) {
      widget.selectedPlayers[selectedPlayer] = false;
    } else {
      widget.selectedPlayers[selectedPlayer] = true;
    }
    onShowForwardButton();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => viewModel.selectedPlayers.length < 2
            ? NewPlayerAndMatchComponent(
                message: emptyPlayerMessage,
                goToNextRoute: (route) => navigator.goTo('$route/', null),
                isShowNewMatchButton: false,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TittleSection(tittle: selectPlayers),
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Observer(
                        builder: (_) => GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.5,
                            ),
                            itemCount: viewModel.selectedPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PlayerCheckBoxWidget(
                                player: viewModel.selectedPlayers.keys
                                    .elementAt(index),
                                onItemSelected: (player) =>
                                    _onSelectedPlayer(player),
                                isChecked: viewModel.selectedPlayers.values
                                    .elementAt(index),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ));
  }

  @override
  void dispose() {
    super.dispose();
    _disposer();
  }
}
