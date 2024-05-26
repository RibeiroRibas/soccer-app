import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/ui/section/players_manager_actions_section.dart';
import 'package:team_draw/modules/match/ui/section/players_manager_app_bar_section.dart';
import 'package:team_draw/modules/match/ui/section/starting_and_reserve_players_section.dart';
import 'package:team_draw/modules/match/view_model/reserve_player_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_two_view_model.dart';
import 'package:team_draw/shared/view/section/switch_players_section.dart';

class PlayersManagerModal extends StatefulWidget {
  const PlayersManagerModal({super.key});

  @override
  State<PlayersManagerModal> createState() => _PlayersManagerModalState();
}

class _PlayersManagerModalState extends State<PlayersManagerModal> {
  late ReservePlayerViewModel viewModel;
  bool isTeamOne = true;

  @override
  void initState() {
    super.initState();
    _initViewModel();
  }

  void _initViewModel() {
    if (isTeamOne) {
      viewModel = Modular.get<ReservePlayerOneViewModel>();
    } else {
      viewModel = Modular.get<ReservePlayerTwoViewModel>();
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
            PlayersManagerAppBarSection(
                teamName: viewModel.team.name!,
                teamShield: viewModel.team.shield!.resourcePath,
                onChangeTeamTap: () => setState(() {
                      isTeamOne = !isTeamOne;
                      _initViewModel();
                    })),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StartingAndReservePlayersSection(
                    startingPlayers: viewModel.startingPlayers,
                    reservePlayers: viewModel.reservePlayers,
                    onPlayersToGetInTap: (player) =>
                        viewModel.addPlayerToPlayersToGetIn(player),
                    onPlayersToGetOutTap: (player) =>
                        viewModel.addPlayerToPlayersToGetOut(player)),
                PlayersManagerActionsSection(
                    playersAlreadyGoneToReserve:
                        viewModel.playersAlreadyGoneToReserve,
                    onChangeNowTap: () => {},
                    onDisableChange: () => {}),
                Observer(
                  builder: (_) => SwitchPlayersSection(
                      playersToGetIn: viewModel.playersToGetIn,
                      removePlayerToPlayerToGetIn: (player) =>
                          viewModel.removePlayerToPlayerToGetIn(player),
                      playersToGetOut: viewModel.playersToGetOut,
                      removePlayerToPlayerToGetOut: (player) =>
                          viewModel.removePlayerToPlayerToGetOut(player)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
