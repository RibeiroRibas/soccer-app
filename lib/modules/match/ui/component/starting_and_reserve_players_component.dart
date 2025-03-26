import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/match/ui/dialog/move_player_alert_dialog.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/list_item/player_overall_list_item.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class StartingAndReservePlayersComponent extends StatelessWidget {
  final List<Player> startingPlayers;
  final List<Player> reservePlayers;
  final Function(Player) onPlayersToGetInTap;
  final Function(Player) onPlayersToGetOutTap;

  const StartingAndReservePlayersComponent(
      {super.key,
      required this.startingPlayers,
      required this.reservePlayers,
      required this.onPlayersToGetInTap,
      required this.onPlayersToGetOutTap});

  Future<void> _movePlayerDialog(BuildContext context, Player player,
      String tittle, Function(Player) movePlayer) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MovePlayerAlertDialog(
            player: player, tittle: tittle, onMovePlayer: movePlayer);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.5),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20.0, // distance between rows
            spacing: 30.0, // distance between chips
            children: [
              TextWithBorderComponent(
                  text: reserves,
                  textStyle: Theme.of(context).textTheme.bodyLarge!),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallListItem(
                        player: reservePlayers.elementAt(index),
                        moveToColumnRight: (player) => _movePlayerDialog(
                            context,
                            player,
                            "${player.name} $willBeNextPlayerToGetOut",
                            (player) => onPlayersToGetInTap(player)));
                  },
                  itemCount: reservePlayers.length),
              TextWithBorderComponent(
                  text: playing,
                  textStyle: Theme.of(context).textTheme.bodyLarge!),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallListItem(
                        player: startingPlayers.elementAt(index),
                        moveToColumnRight: (player) => _movePlayerDialog(
                            context,
                            player,
                            "${player.name} $willBeNextPlayerToGetIn",
                            (player) => onPlayersToGetOutTap(player)));
                  },
                  itemCount: startingPlayers.length),
            ],
          ),
        ),
      ),
    );
  }
}
