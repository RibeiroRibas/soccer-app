import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_weak_points.dart';
import 'package:team_draw/modules/new_player/view/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/view/player_characteristics/player_characteristics_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerWeakPointsView extends StatefulWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageVIew;

  const PlayerWeakPointsView(
      {super.key, required this.player, required this.goToNextPageVIew});

  @override
  State<PlayerWeakPointsView> createState() => _PlayerWeakPointsViewState();
}

class _PlayerWeakPointsViewState extends State<PlayerWeakPointsView> {
  @override
  Widget build(BuildContext context) {
    final List<PlayerWeakPoints> playerWeakPoints =
        PlayerWeakPoints.allPlayerWeakPoints;

    void setPlayerWeakPoints(int index) {
      if (widget.player.isWeakPointNotSelected(playerWeakPoints[index])) {
        if (widget.player.isMaxWeakPointsSelected()) {
          return;
        }
        if (widget.player.isLastWeakPointAllowed()) {
          widget.player.weakPoints.add(playerWeakPoints[index]);
          widget.goToNextPageVIew(NewPlayerPageView.overall);
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

    return PlayerCharacteristicsView(
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
    );
  }
}
