import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class PlayersManagerActionsSection extends StatelessWidget {
  final Function onSwitchPlayer;

  const PlayersManagerActionsSection({super.key, required this.onSwitchPlayer});

  @override
  Widget build(BuildContext context) {
    final MatchTimerViewModel viewModel = Modular.get<MatchTimerViewModel>();
    return Expanded(
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    TextWithBorderComponent(
                        text: nextSwitchIn,
                        textStyle: Theme.of(context).textTheme.bodyLarge!),
                    const SizedBox(height: 30),
                    const ReservePlayerTimerComponent(),
                    const SizedBox(height: 50),
                    ElevatedButtonComponent(
                        onButtonPressed: () => onSwitchPlayer.call(),
                        text: switchNow),
                    ElevatedButtonComponent(
                        onButtonPressed: () => {
                              onSwitchPlayer.call(),
                              viewModel.resetTimer(),
                            },
                        text: switchNowAndResetTimer),
                    const SizedBox(height: 50),
                    Observer(
                      builder: (_) => ElevatedButtonComponent(
                          onButtonPressed: () =>
                              viewModel.onDisableAutomaticSwitch(),
                          text: viewModel.isDisableAutomaticSwitch
                              ? enableAutomaticSwitch
                              : disableAutomaticSwitchToAllTeams),
                    ),
                    const SizedBox(height: 60),
                  ],
                ))));
  }
}
