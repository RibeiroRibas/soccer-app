import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/modules/new_player/view/confirm/player_info_detail_widget.dart';
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
        PlayerInfoDetailWidget(description: nameConfirm, value: player.name!),
        PlayerInfoDetailWidget(
          description: principalPositionConfirm,
          value: player.principalPosition!.name,
        ),
        PlayerInfoDetailWidget(
          description: overallConfirm,
          value: player.overall!.toStringAsFixed(1),
        ),
        PlayerInfoDetailWidget(
          description: strengthsConfirm,
          value: player.strengths.map((e) => e.characteristic).join(' , '),
        ),
        PlayerInfoDetailWidget(
          description: weakPointsConfirm,
          value: player.weakPoints.map((e) => e.characteristic).join(' , '),
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
