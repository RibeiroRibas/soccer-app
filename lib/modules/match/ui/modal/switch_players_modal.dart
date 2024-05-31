import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_two_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';
import 'package:team_draw/shared/view/section/switch_players_section.dart';

class SwitchPlayerModal extends StatefulWidget {
  final Function onCloseModal;

  const SwitchPlayerModal({super.key, required this.onCloseModal});

  @override
  State<SwitchPlayerModal> createState() => _SwitchPlayerModalState();
}

class _SwitchPlayerModalState extends State<SwitchPlayerModal> {
  final PlayersOneViewModel playerOneViewModel =
      Modular.get<PlayersOneViewModel>();
  final PlayersTwoViewModel playersTwoViewModel =
      Modular.get<PlayersTwoViewModel>();
  final MatchViewModel matchViewModel = Modular.get<MatchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => SwitchPlayersSection(
                playersToGetIn: playerOneViewModel.playersToGetIn,
                playersToGetOut: playerOneViewModel.playersToGetOut,
                teamName: playerOneViewModel.team.name!,
                teamShield: playerOneViewModel.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    playerOneViewModel.playersAlreadyGoneToReserve),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.5),
                      child: Wrap(alignment: WrapAlignment.center, children: [
                        TextWithBorderComponent(
                          text: nextSwitchIn,
                          textStyle: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        const SizedBox(height: 30),
                        const ReservePlayerTimerComponent(),
                      ])))),
          Observer(
            builder: (_) => SwitchPlayersSection(
                playersToGetIn: playersTwoViewModel.playersToGetIn,
                playersToGetOut: playersTwoViewModel.playersToGetOut,
                teamName: playersTwoViewModel.team.name!,
                teamShield: playersTwoViewModel.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    playersTwoViewModel.playersAlreadyGoneToReserve),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.onCloseModal.call();
    super.dispose();
  }
}
