import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';
import 'package:team_draw/shared/view/component/player_overall/player_overall_item_component.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class PlayersManagerActionsSection extends StatelessWidget {
  final List<Player> playersAlreadyGoneToReserve;
  final Function onChangeNowTap;
  final Function onDisableChange;

  const PlayersManagerActionsSection(
      {super.key,
      required this.playersAlreadyGoneToReserve,
      required this.onChangeNowTap,
      required this.onDisableChange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    TextWithBorderComponent(
                        text: nextChangeIn,
                        textStyle: Theme.of(context).textTheme.bodyLarge!),
                    const SizedBox(height: 30),
                    const ReservePlayerTimerComponent(),
                    const SizedBox(height: 50),
                    ElevatedButtonComponent(
                        onButtonPressed: () => onChangeNowTap.call(),
                        text: changeNow),
                    const SizedBox(height: 50),
                    ElevatedButtonComponent(
                        onButtonPressed: () => onDisableChange.call(),
                        text: disableChange),
                    const SizedBox(height: 60),
                    TextWithBorderComponent(
                        text: whoAlreadyGoToReserve,
                        textStyle: Theme.of(context).textTheme.bodyLarge!),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 175,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PlayerOverallItemComponent(
                                player: playersAlreadyGoneToReserve
                                    .elementAt(index));
                          },
                          itemCount: playersAlreadyGoneToReserve.length),
                    ),
                  ],
                ))));
  }
}
