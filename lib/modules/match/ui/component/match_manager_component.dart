import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/match/ui/component/match_score_component.dart';
import 'package:team_draw/modules/match/ui/component/match_timer_component.dart';
import 'package:team_draw/modules/match/ui/component/reserve_player_timer_component.dart';
import 'package:team_draw/modules/match/ui/modal/players_manager_modal.dart';

class MatchManagerComponent extends StatelessWidget {
  final int scoreTeamOne;
  final int scoreTeamTwo;
  final Function(bool, bool) onChangeScore;
  final int timeToChangePlayer;

  const MatchManagerComponent(
      {super.key,
      required this.scoreTeamOne,
      required this.scoreTeamTwo,
      required this.onChangeScore,
      required this.timeToChangePlayer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MatchScoreComponent(
              scoreTeamOne: scoreTeamOne,
              scoreTeamTwo: scoreTeamTwo,
              onChangeScore: (isScoreTeamOne, isIncreaseScore) =>
                  onChangeScore(isScoreTeamOne, isIncreaseScore)),
          const Center(child: MatchTimerComponent()),
          const Expanded(child: SizedBox()),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ReserveBenchWidget(isTeamOne: false),
              ReservePlayerTimerComponent(),
              _ReserveBenchWidget(isTeamOne: true),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ReserveBenchWidget extends StatelessWidget {
  final bool isTeamOne;

  const _ReserveBenchWidget({required this.isTeamOne});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showBarModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: PlayersManagerModal(isTeamOne: isTeamOne))),
        child: SizedBox(
            width: 60,
            child: Image.asset("$imageInitialPath/switch-player.png",
                color: Theme.of(context).primaryColor)));
  }
}
