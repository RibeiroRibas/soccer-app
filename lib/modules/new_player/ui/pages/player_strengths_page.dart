import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_strengths.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/ui/components/player_characteristics_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerStrengthsPage extends StatefulWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const PlayerStrengthsPage(
      {super.key, required this.player, required this.goToNextPageView});

  @override
  State<PlayerStrengthsPage> createState() => _PlayerStrengthsPageState();
}

class _PlayerStrengthsPageState extends State<PlayerStrengthsPage> {
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
    return PlayerCharacteristicsComponent(
      questionText: strengths,
      subQuestionText: selectUpToTwoOptions,
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
    );
  }
}
