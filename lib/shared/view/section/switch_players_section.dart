import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/view/component/team_shield_and_name_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class SwitchPlayersSection extends StatelessWidget {
  final List<Player> playersToGetIn;
  final Function(Player)? removePlayerToPlayerToGetIn;
  final List<Player> playersToGetOut;
  final Function(Player)? removePlayerToPlayerToGetOut;
  final String? teamName;
  final String? teamShield;
  final List<Player> playersAlreadyGoneToReserve;

  const SwitchPlayersSection(
      {super.key,
      required this.playersToGetIn,
      this.removePlayerToPlayerToGetIn,
      required this.playersToGetOut,
      this.removePlayerToPlayerToGetOut,
      this.teamName,
      this.teamShield,
      required this.playersAlreadyGoneToReserve});

  Future<void> movePlayerDialog(
    Player player,
    String tittle,
    Function(Player) movePlayer,
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(tittle),
          actions: <Widget>[
            TextButton(
                onPressed: () => {
                      movePlayer(player),
                      Navigator.of(context).pop(),
                    },
                style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.onSecondary)),
                child: const Text(ok)),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  foregroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.onSecondary)),
              child: const Text(cancel),
            ),
          ],
        );
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
              if (teamName != null && teamShield != null)
                TeamShieldAndNameComponent(
                    teamName: teamName!, teamShield: teamShield!),
              TextWithBorderComponent(
                  text: whoToGetIn,
                  textStyle: Theme.of(context).textTheme.bodyLarge!),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallItemComponent(
                        player: playersToGetIn[index],
                        moveToColumnLeft: removePlayerToPlayerToGetIn != null
                            ? (player) => movePlayerDialog(
                                player,
                                "${player.name} $willBeContinuousInReserve",
                                (player) =>
                                    removePlayerToPlayerToGetIn!.call(player),
                                context)
                            : null);
                  },
                  itemCount: playersToGetIn.length),
              TextWithBorderComponent(
                  text: whoToGetOut,
                  textStyle: Theme.of(context).textTheme.bodyLarge!),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallItemComponent(
                        player: playersToGetOut[index],
                        moveToColumnLeft: removePlayerToPlayerToGetOut != null
                            ? (player) => movePlayerDialog(
                                player,
                                "${player.name} $willBeContinuousPlaying",
                                (player) =>
                                    removePlayerToPlayerToGetOut!(player),
                                context)
                            : null);
                  },
                  itemCount: playersToGetOut.length),
              TextWithBorderComponent(
                  text: whoAlreadyGoToReserve,
                  textStyle: Theme.of(context).textTheme.bodyLarge!),
              const SizedBox(height: 30),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PlayerOverallItemComponent(
                        player: playersAlreadyGoneToReserve.elementAt(index));
                  },
                  itemCount: playersAlreadyGoneToReserve.length),
            ],
          ),
        ),
      ),
    );
  }
}
