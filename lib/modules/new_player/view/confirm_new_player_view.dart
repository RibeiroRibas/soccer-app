import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/state/player_state.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/section/tittle_section.dart';

class ConfirmNewPlayerView extends StatefulWidget {
  final Player player;

  const ConfirmNewPlayerView({super.key, required this.player});

  @override
  State<ConfirmNewPlayerView> createState() => _ConfirmNewPlayerViewState();
}

class _ConfirmNewPlayerViewState extends State<ConfirmNewPlayerView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
  final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();

  @override
  void initState() {
    super.initState();
    reaction((_) => viewModel.playerState, (playerState) {
      if (playerState is SuccessPlayerState) {
        navigator.goTo('$newPlayerRote$successNewPlayerRote', null);
      }
    });
  }

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
              widget.player.name!,
              style: greenTheme.textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          children: [
            const Text(principalPositionConfirm),
            Text(
              widget.player.principalPosition!.name,
              style: greenTheme.textTheme.labelMedium,
            )
          ],
        ),
        Row(
          children: [
            const Text(secondaryPositionConfirm),
            Text(
              widget.player.secondaryPosition != null
                  ? widget.player.secondaryPosition!.name
                  : "",
              style: greenTheme.textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          children: [
            const Text(overallConfirm),
            Text(
              widget.player.overall!.toStringAsFixed(1),
              style: greenTheme.textTheme.labelMedium,
            )
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ElevatedButtonComponent(
                onButtonPressed: () {
                  viewModel.savePlayer(widget.player);
                },
                text: savePlayer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
