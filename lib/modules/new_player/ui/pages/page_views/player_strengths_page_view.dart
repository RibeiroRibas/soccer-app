import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_strengths.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/components/action_buttons_component.dart';
import 'package:team_draw/modules/new_player/ui/components/player_characteristics_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerStrengthsPageView extends StatefulWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerStrengthsPageView(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  State<PlayerStrengthsPageView> createState() =>
      _PlayerStrengthsPageViewState();
}

class _PlayerStrengthsPageViewState extends State<PlayerStrengthsPageView> {
  final List<PlayerStrengths> playerStrengths = PlayerStrengths.all();

  void setStrengthsPoints(int index) {
    if (widget.player.isStrengthsNotSelected(playerStrengths[index])) {
      if (widget.player.isLastStrengthsAllowed()) {
        widget.player.strengths.add(playerStrengths[index]);
        widget.goToNextPageView(NewPlayerPageView.weakPoints);
        return;
      }
      setState(() {
        widget.player.strengths.add(playerStrengths[index]);
      });
    } else {
      setState(() {
        widget.player.strengths.remove(playerStrengths[index]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerCharacteristicsComponent(
          heightSize: 200,
          questionText: strengths,
          subQuestionText: optional,
          positions: List.generate(
            playerStrengths.length,
            (index) {
              return CheckboxListTile(
                title: Text(
                  playerStrengths.elementAt(index).characteristic,
                  style: const TextStyle(fontSize: 12),
                  softWrap: false,
                ),
                value: widget.player.strengths
                    .any((element) => element == playerStrengths[index]),
                onChanged: (_) => setStrengthsPoints(index),
              );
            },
          ),
        ),
        const SizedBox(width: 20),
        ActionButtonsComponent(
            onContinueTap: () =>
                widget.goToNextPageView(NewPlayerPageView.weakPoints),
            onSaveTap: () => widget.goToNextPageView(NewPlayerPageView.finish)),
      ],
    );
  }
}
