import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class PlayerPositionPageView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  PlayerPositionPageView(
      {super.key, required this.player, required this.goToNextPageView});

  final List<Position> positions = Position.values;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    focusNode.requestFocus();
    return Column(
      children: [
        TextWithBorderComponent(
            text: principalPositionQuestion,
            textStyle: Theme.of(context).textTheme.bodyLarge!),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5,
            ),
            children: List.generate(
              positions.length,
              (index) {
                return CheckboxListTile(
                  title: Text(
                    positions.elementAt(index).name,
                    style: const TextStyle(fontSize: 12),
                    softWrap: false,
                  ),
                  focusNode: focusNode,
                  value: player.principalPosition != null
                      ? player.principalPosition! == positions[index]
                      : false,
                  onChanged: (_) {
                    player.principalPosition = Position.fromIndex(index);
                    goToNextPageView(NewPlayerPageView.overall);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
