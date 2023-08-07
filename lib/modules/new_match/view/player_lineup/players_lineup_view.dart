import 'package:flutter/material.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/player_check_box_widget.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/section/tittle_section.dart';

class PlayersLineupView extends StatelessWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const PlayersLineupView({
    Key? key,
    required this.selectedPlayers,
    required this.matchSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onSelectedPlayer(Player selectedPlayer) {
      selectedPlayers[selectedPlayer] = !selectedPlayers[selectedPlayer]!;
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
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                ),
                itemCount: selectedPlayers.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlayerCheckBoxWidget(
                    player: selectedPlayers.keys.elementAt(index),
                    onItemSelected: (player) => onSelectedPlayer(player),
                    isChecked: selectedPlayers.values.elementAt(index),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
