import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/controllers/team_controller.dart';
import 'package:team_draw/modules/match/ui/component/players_manager_actions_component.dart';
import 'package:team_draw/modules/match/ui/component/players_manager_app_bar_component.dart';
import 'package:team_draw/modules/match/ui/component/starting_and_reserve_players_component.dart';
import 'package:team_draw/shared/ui/component/switch_players_component.dart';

class PlayersManagerModal extends StatefulWidget {
  final bool isTeamOne;

  const PlayersManagerModal({super.key, required this.isTeamOne});

  @override
  State<PlayersManagerModal> createState() => _PlayersManagerModalState();
}

class _PlayersManagerModalState extends State<PlayersManagerModal> {
  late TeamController _controller;

  @override
  void initState() {
    super.initState();
    _initViewModel();
  }

  void _initViewModel() {
    if (widget.isTeamOne) {
      _controller = Modular.get<TeamOneController>();
    } else {
      _controller = Modular.get<TeamTwoController>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            PlayersManagerAppBarComponent(
                teamName: _controller.team.name!,
                teamShield: _controller.team.shield!.resourcePath),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) => StartingAndReservePlayersComponent(
                      startingPlayers: _controller.startingPlayers,
                      reservePlayers: _controller.reservePlayers,
                      onPlayersToGetInTap: (player) =>
                          _controller.addPlayerToPlayersToGetIn(player),
                      onPlayersToGetOutTap: (player) =>
                          _controller.addPlayerToPlayersToGetOut(player)),
                ),
                PlayersManagerActionsComponent(
                    onSwitchPlayer: () => _controller.switchPlayers()),
                Observer(
                  builder: (_) => SwitchPlayersComponent(
                      playersToGetIn: _controller.playersToGetIn,
                      removePlayerToPlayerToGetIn: (player) =>
                          _controller.removePlayerToPlayerToGetIn(player),
                      playersToGetOut: _controller.playersToGetOut,
                      removePlayerToPlayerToGetOut: (player) =>
                          _controller.removePlayerToPlayerToGetOut(player),
                      playersAlreadyGoneToReserve:
                          _controller.playersAlreadyGoneToReserve),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
