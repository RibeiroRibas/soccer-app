import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/controllers/player_lineup_controller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/ui/components/player_check_box_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/tittle_component.dart';

class PlayersLineupPage extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const PlayersLineupPage({
    super.key,
    required this.selectedPlayers,
    required this.matchSettings,
    required this.onShowForwardButton,
  });

  @override
  State<PlayersLineupPage> createState() => _PlayersLineupPageState();
}

class _PlayersLineupPageState extends State<PlayersLineupPage> {
  final _controller = Modular.get<PlayerLineupController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _controller.findAndSetAllPlayers(widget.selectedPlayers);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction((_) => _controller.selectedPlayers,
        (Map<Player, bool> selectedPlayers) {
      onShowForwardButton();
      widget.selectedPlayers.clear();
      widget.selectedPlayers.addAll(selectedPlayers);
    });
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
        builder: (_) => _controller.selectedPlayers.length < 2
            ? NewPlayerAndMatchComponent(
                message: emptyPlayerMessage,
                goToNextRoute: (route) => _navigator.goTo('$route/', null),
                isShowNewMatchButton: false,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TittleComponent(tittle: selectPlayers),
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
                            itemCount: _controller.selectedPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PlayerCheckBoxComponent(
                                player: _controller.selectedPlayers.keys
                                    .elementAt(index),
                                onItemSelected: (player) =>
                                    _onSelectedPlayer(player),
                                isChecked: _controller.selectedPlayers.values
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
