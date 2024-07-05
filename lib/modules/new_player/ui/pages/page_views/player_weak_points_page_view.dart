import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_weak_points.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/components/action_buttons_component.dart';
import 'package:team_draw/modules/new_player/ui/components/player_characteristics_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerWeakPointsPageView extends StatefulWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerWeakPointsPageView(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  State<PlayerWeakPointsPageView> createState() =>
      _PlayerWeakPointsPageViewState();
}

class _PlayerWeakPointsPageViewState extends State<PlayerWeakPointsPageView> {
  final List<PlayerWeakPoints> playerWeakPoints = PlayerWeakPoints.all();

  void setPlayerWeakPoints(int index) {
    if (widget.player.isWeakPointNotSelected(playerWeakPoints[index])) {
      if (widget.player.isLastWeakPointAllowed()) {
        widget.player.weakPoints.add(playerWeakPoints[index]);
        widget.goToNextPageView(NewPlayerPageView.confirmNewPlayer);
        return;
      }
      setState(() {
        widget.player.weakPoints.add(playerWeakPoints[index]);
      });
    } else {
      setState(() {
        widget.player.weakPoints.remove(playerWeakPoints[index]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerCharacteristicsComponent(
          questionText: weakPoints,
          subQuestionText: selectUpToTwoOptions,
          positions: List.generate(
            playerWeakPoints.length,
            (index) {
              return CheckboxListTile(
                title: Text(
                  playerWeakPoints.elementAt(index).characteristic,
                  style: const TextStyle(fontSize: 12),
                  softWrap: false,
                ),
                value: widget.player.weakPoints
                    .any((element) => element == playerWeakPoints[index]),
                onChanged: (_) => setPlayerWeakPoints(index),
              );
            },
          ),
        ),
        const SizedBox(width: 20),
        ActionButtonsComponent(
            onContinueTap: () =>
                widget.goToNextPageView(NewPlayerPageView.confirmNewPlayer),
            onSaveTap: () => widget.goToNextPageView(NewPlayerPageView.finish)),
      ],
    );
  }
}
