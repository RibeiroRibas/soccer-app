import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/controllers/players_controller.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';
import 'package:team_draw/shared/ui/component/switch_players_component.dart';

class SwitchPlayerModal extends StatefulWidget {
  final Function onCloseModal;

  const SwitchPlayerModal({super.key, required this.onCloseModal});

  @override
  State<SwitchPlayerModal> createState() => _SwitchPlayerModalState();
}

class _SwitchPlayerModalState extends State<SwitchPlayerModal> {
  final _playersOneController = Modular.get<PlayersOneController>();
  final _playersTwoController = Modular.get<PlayersTwoController>();

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
            builder: (_) => SwitchPlayersComponent(
                playersToGetIn: _playersOneController.playersToGetIn,
                playersToGetOut: _playersOneController.playersToGetOut,
                teamName: _playersOneController.team.name!,
                teamShield: _playersOneController.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    _playersOneController.playersAlreadyGoneToReserve),
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
            builder: (_) => SwitchPlayersComponent(
                playersToGetIn: _playersTwoController.playersToGetIn,
                playersToGetOut: _playersTwoController.playersToGetOut,
                teamName: _playersTwoController.team.name!,
                teamShield: _playersTwoController.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    _playersTwoController.playersAlreadyGoneToReserve),
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
