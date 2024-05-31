import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/modules/match/ui/modal/switch_players_modal.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';

class ReservePlayerTimerComponent extends StatefulWidget {
  const ReservePlayerTimerComponent({super.key});

  @override
  State<ReservePlayerTimerComponent> createState() =>
      _ReservePlayerTimerComponentState();
}

class _ReservePlayerTimerComponentState
    extends State<ReservePlayerTimerComponent> {
  MatchTimerViewModel viewModel = Modular.get<MatchTimerViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.startReservePlayerTimer();
    reaction((_) => viewModel.isAlmostTimeToSwitchPlayer,
        (isAlmostTimeToChangePlayer) {
      if (isAlmostTimeToChangePlayer && viewModel.isNotShowingModal) {
        _showSwitchPlayersModal();
      }
    });
  }

  Future<void> _showSwitchPlayersModal() {
    viewModel.isNotShowingModal = false;
    return showBarModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: SwitchPlayerModal(
                onCloseModal: () => viewModel.isNotShowingModal = true)));
  }

  String _formatIntToString(int time) {
    return time.toString().length == 1 ? "0$time" : time.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSwitchPlayersModal(),
      child: Stack(
        children: [
          Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: kElevationToShadow[2]),
                  child: const SizedBox(width: 100, height: 30))),
          Observer(
            builder: (_) => Center(
                child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            _formatIntToString(viewModel.minutesToSwitchPlayer),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 26)),
                        Text(":", style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                            _formatIntToString(viewModel.secondsToSwitchPlayer),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 26)),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
