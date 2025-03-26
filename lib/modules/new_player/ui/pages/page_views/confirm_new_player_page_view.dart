import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class ConfirmNewPlayerPageView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;

  const ConfirmNewPlayerPageView({
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
        TextWithBorderComponent(
          text: playerConfirmData,
          textStyle: Theme.of(context).textTheme.bodyLarge!,
        ),
        const SizedBox(height: 15),
        _PlayerInfoDetailComponent(
            description: nameConfirm, value: player.name!),
        _PlayerInfoDetailComponent(
          description: principalPositionConfirm,
          value: player.principalPosition!.name,
        ),
        _PlayerInfoDetailComponent(
          description: overallConfirm,
          value: player.overall!.toStringAsFixed(1),
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

class _PlayerInfoDetailComponent extends StatelessWidget {
  final String description;
  final String value;

  const _PlayerInfoDetailComponent(
      {required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description),
        Text(
          value,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
