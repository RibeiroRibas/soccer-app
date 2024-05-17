import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_view_model.dart';
import 'package:team_draw/shared/helper/list_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/drop_down_button_component.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';
import 'package:team_draw/shared/view/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class ReservePlayersModal extends StatefulWidget {
  final List<Player> startingPlayers;
  final List<Player> reservePlayers;
  final MatchSettings matchSettings;

  const ReservePlayersModal(
      {super.key,
      required this.startingPlayers,
      required this.reservePlayers,
      required this.matchSettings});

  @override
  State<ReservePlayersModal> createState() => _ReservePlayersModalState();
}

class _ReservePlayersModalState extends State<ReservePlayersModal> {
  ReservePlayerViewModel viewModel = Modular.get<ReservePlayerViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init(widget.startingPlayers, widget.reservePlayers);
  }

  Future<void> _movePlayerDialog(
      Player player, String tittle, Function(Player) movePlayer) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(tittle),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                movePlayer(player),
                Navigator.of(context).pop(),
              },
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground)),
              child: const Text(ok),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground)),
              child: const Text(cancel),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        padding: const EdgeInsets.all(12.0),
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                  ),
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
                          return PlayerOverallItemComponent(
                            player: viewModel.reservePlayers[index],
                            moveToColumnRight: (player) => _movePlayerDialog(
                              player,
                              "${player.name} $willBeNextPlayerToGetOut",
                              (player) => viewModel.playersToGetIn.add(player),
                            ),
                          );
                        },
                        itemCount: viewModel.reservePlayers.length,
                      ),
                      TextWithBorderComponent(
                          text: playing,
                          textStyle: Theme.of(context).textTheme.bodyLarge!),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PlayerOverallItemComponent(
                            player: widget.startingPlayers[index],
                            moveToColumnRight: (player) => _movePlayerDialog(
                              player,
                              "${player.name} $willBeNextPlayerToGetIn",
                              (player) =>
                                  viewModel.addPlayerToPlayersToGetOut(player),
                            ),
                          );
                        },
                        itemCount: widget.startingPlayers.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.5),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    // distance between chips
                    children: [
                      TextWithBorderComponent(
                        text: nextChangeIn,
                        textStyle: Theme.of(context).textTheme.bodyLarge!,
                      ),
                      const SizedBox(height: 80),
                      ElevatedButtonComponent(
                        onButtonPressed: () {},
                        text: changeNow,
                      ),
                      const SizedBox(height: 50),
                      ElevatedButtonComponent(
                        onButtonPressed: () {},
                        text: turnOffChange,
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: [
                          const Text(changePlayerEvery),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: DropDownButtonComponent(
                              value: widget.matchSettings.timeToChangePlayer,
                              onValueChange: (value) => widget
                                  .matchSettings.timeToChangePlayer = value,
                              width: MediaQuery.of(context).size.width / 4,
                              values: ListHelper.getListOfMinutes(),
                              labelText: minute,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.5),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20.0, // distance between rows
                    spacing: 30.0, // distance between chips
                    children: [
                      TextWithBorderComponent(
                          text: whoToGetIn,
                          textStyle: Theme.of(context).textTheme.bodyLarge!),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PlayerOverallItemComponent(
                            player: viewModel.playersToGetIn[index],
                            moveToColumnLeft: (player) => _movePlayerDialog(
                              player,
                              "${player.name} $willBeContinuousInReserve",
                              (player) =>
                                  viewModel.removePlayerToPlayerToGetIn(player),
                            ),
                          );
                        },
                        itemCount: viewModel.playersToGetIn.length,
                      ),
                      TextWithBorderComponent(
                          text: whoToGetOut,
                          textStyle: Theme.of(context).textTheme.bodyLarge!),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PlayerOverallItemComponent(
                            player: viewModel.playersToGetOut[index],
                            moveToColumnLeft: (player) => _movePlayerDialog(
                              player,
                              "${player.name} $willBeContinuousPlaying",
                              (player) => viewModel
                                  .removePlayerToPlayerToGetOut(player),
                            ),
                          );
                        },
                        itemCount: viewModel.playersToGetOut.length,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
