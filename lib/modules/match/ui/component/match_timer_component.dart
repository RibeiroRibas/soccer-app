import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';

class MatchTimerComponent extends StatefulWidget {
  const MatchTimerComponent({super.key});

  @override
  State<MatchTimerComponent> createState() => _MatchTimerComponentState();
}

class _MatchTimerComponentState extends State<MatchTimerComponent> {
  MatchTimerViewModel viewModel = Modular.get<MatchTimerViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.startMatchTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Stack(
        children: [
          const _BoxShadowWidget(sizedBox: SizedBox(width: 150, height: 75)),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _TimerWidget(
                    hours: viewModel.hour,
                    minutes: viewModel.minutes,
                    seconds: viewModel.seconds),
                _TimerControllerWidget(
                    onPlayOrPauseTap: (isPaused) =>
                        viewModel.isPaused = isPaused,
                    onStopTap: (isStopped) => viewModel.isStopped = isStopped),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimerWidget extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;

  const _TimerWidget(
      {required this.hours, required this.minutes, required this.seconds});

  String _formatIntToString(int time) {
    return time.toString().length == 1 ? "0$time" : time.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(_formatIntToString(hours),
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26)),
        Text(":", style: Theme.of(context).textTheme.bodyLarge),
        Text(_formatIntToString(minutes),
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26)),
        Text(":", style: Theme.of(context).textTheme.bodyLarge),
        Text(_formatIntToString(seconds),
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26)),
      ],
    );
  }
}

class _TimerControllerWidget extends StatelessWidget {
  final Function(bool) onPlayOrPauseTap;
  final Function(bool) onStopTap;

  const _TimerControllerWidget(
      {required this.onPlayOrPauseTap, required this.onStopTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => onPlayOrPauseTap(false)),
        IconButton(
            onPressed: () => onPlayOrPauseTap(true),
            icon: const Icon(Icons.pause)),
        IconButton(
            icon: const Icon(Icons.stop), onPressed: () => onStopTap(true)),
      ],
    );
  }
}

class _BoxShadowWidget extends StatelessWidget {
  final Widget sizedBox;

  const _BoxShadowWidget({required this.sizedBox});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
            boxShadow: kElevationToShadow[2]),
        child: sizedBox);
  }
}
