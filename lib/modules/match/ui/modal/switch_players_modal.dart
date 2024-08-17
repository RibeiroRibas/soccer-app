import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/controllers/team_controller.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/switch_players_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class SwitchPlayerModal extends StatefulWidget {
  final Function onCloseModal;

  const SwitchPlayerModal({super.key, required this.onCloseModal});

  @override
  State<SwitchPlayerModal> createState() => _SwitchPlayerModalState();
}

class _SwitchPlayerModalState extends State<SwitchPlayerModal> {
  final _teamOneController = Modular.get<TeamOneController>();
  final _teamTwoController = Modular.get<TeamTwoController>();

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
                playersToGetIn: _teamTwoController.playersToGetIn,
                playersToGetOut: _teamTwoController.playersToGetOut,
                teamName: _teamTwoController.team.name!,
                teamShield: _teamTwoController.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    _teamTwoController.playersAlreadyGoneToReserve),
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
                playersToGetIn: _teamOneController.playersToGetIn,
                playersToGetOut: _teamOneController.playersToGetOut,
                teamName: _teamOneController.team.name!,
                teamShield: _teamOneController.team.shield!.resourcePath,
                playersAlreadyGoneToReserve:
                    _teamOneController.playersAlreadyGoneToReserve),
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
