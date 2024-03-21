import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/player_check_box_widget.dart';
import 'package:team_draw/modules/new_match/view_model/player_lineup_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/section/tittle_section.dart';

class PlayersLineupView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const PlayersLineupView({
    super.key,
    required this.selectedPlayers,
    required this.matchSettings,
  });

  @override
  State<PlayersLineupView> createState() => _PlayersLineupViewState();
}

class _PlayersLineupViewState extends State<PlayersLineupView> {
  final PlayerLineupViewModel viewModel = Modular.get<PlayerLineupViewModel>();
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
      widget.selectedPlayers.clear();
      widget.selectedPlayers.addAll(selectedPlayers);
    });
  }

  Future<void> _findAllPlayers() async {
    await viewModel.findAndSetAllPlayers(widget.selectedPlayers);
  }

  @override
  Widget build(BuildContext context) {
    void onSelectedPlayer(Player selectedPlayer) {
      if (widget.selectedPlayers[selectedPlayer] == true) {
        widget.selectedPlayers[selectedPlayer] = false;
      } else {
        widget.selectedPlayers[selectedPlayer] = true;
      }
    }

    return SingleChildScrollView(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: viewModel.selectedPlayers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PlayerCheckBoxWidget(
                      player: viewModel.selectedPlayers.keys.elementAt(index),
                      onItemSelected: (player) => onSelectedPlayer(player),
                      isChecked:
                          viewModel.selectedPlayers.values.elementAt(index),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _disposer();
  }
}
