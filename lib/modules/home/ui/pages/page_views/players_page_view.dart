import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/new_player_and_match_component.dart';
import 'package:team_draw/shared/ui/component/players_component.dart';

class PlayersPageView extends StatefulWidget {
  final List<PlayerScore> playersScore;
  final Future<bool> Function(Player) onDeletePlayerTap;

  const PlayersPageView(
      {super.key, required this.playersScore, required this.onDeletePlayerTap});

  @override
  State<PlayersPageView> createState() => _PlayersPageViewState();
}

class _PlayersPageViewState extends State<PlayersPageView> {
  @override
  Widget build(BuildContext context) {
    final navigator = Modular.get<HomeRouteNavigator>();

    return widget.playersScore.isEmpty
        ? NewPlayerAndMatchComponent(
            message: emptyPlayerMessage,
            goToNewPlayerRoute: (route) =>
                navigator.goTo('$route/', arguments: {"player": Player()}),
            goToNewMatchRoute: (route) => navigator.goTo('$route/'),
            isShowNewMatchButton: false,
          )
        : PlayersComponent(
            playersScore: widget.playersScore,
            goToUpdatePlayerRoute: (player) => navigator
                .goTo("$newPlayerRote/", arguments: {"player": player}),
            onDeletePlayerTap: (player) {
              widget.onDeletePlayerTap(player).then((canDeletePlayer) {
                if (canDeletePlayer) {
                  setState(() {
                    widget.playersScore.removeWhere(
                        (playerScore) => playerScore.player.id == player.id);
                  });
                }
              });
            },
          );
  }
}
