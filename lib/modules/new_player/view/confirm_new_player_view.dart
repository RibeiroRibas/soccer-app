import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/view/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';
import 'package:team_draw/shared/view/section/tittle_section.dart';

class ConfirmNewPlayerView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const ConfirmNewPlayerView({
    super.key,
    required this.player,
    required this.goToNextPageView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TittleSection(tittle: playerConfirmData),
        const SizedBox(height: 15),
        Row(
          children: [
            const Text(nameConfirm),
            Text(
              player.name!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          children: [
            const Text(principalPositionConfirm),
            Text(
              player.principalPosition!.name,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
        Row(
          children: [
            const Text(secondaryPositionConfirm),
            Text(
              player.secondaryPosition != null
                  ? player.secondaryPosition!.name
                  : "",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          children: [
            const Text(overallConfirm),
            Text(
              player.overall!.toStringAsFixed(1),
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ElevatedButtonComponent(
                onButtonPressed: () =>
                    goToNextPageView(NewPlayerPageView.finish),
                text: savePlayer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
