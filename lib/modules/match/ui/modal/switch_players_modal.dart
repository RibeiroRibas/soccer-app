import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_two_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/section/switch_players_section.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class SwitchPlayerModal extends StatefulWidget {
  const SwitchPlayerModal({super.key});

  @override
  State<SwitchPlayerModal> createState() => _SwitchPlayerModalState();
}

class _SwitchPlayerModalState extends State<SwitchPlayerModal> {
  final ReservePlayerOneViewModel reservePlayerOneViewModel =
      Modular.get<ReservePlayerOneViewModel>();
  final ReservePlayerTwoViewModel reservePlayerTwoViewModel =
      Modular.get<ReservePlayerTwoViewModel>();
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
          SwitchPlayersSection(
              playersToGetIn: reservePlayerOneViewModel.playersToGetIn,
              playersToGetOut: reservePlayerOneViewModel.playersToGetOut,
              teamName: reservePlayerOneViewModel.team.name!,
              teamShield: reservePlayerOneViewModel.team.shield!.resourcePath),
          Expanded(
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.5),
                      child: Wrap(alignment: WrapAlignment.center, children: [
                        TextWithBorderComponent(
                          text: nextChangeIn,
                          textStyle: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        const SizedBox(height: 30),
                        const ReservePlayerTimerComponent()
                      ])))),
          SwitchPlayersSection(
              playersToGetIn: reservePlayerTwoViewModel.playersToGetIn,
              playersToGetOut: reservePlayerTwoViewModel.playersToGetOut,
              teamName: reservePlayerTwoViewModel.team.name!,
              teamShield: reservePlayerTwoViewModel.team.shield!.resourcePath),
        ],
      ),
    );
  }
}
