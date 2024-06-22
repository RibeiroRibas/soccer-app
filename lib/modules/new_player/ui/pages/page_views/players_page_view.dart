import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/new_player_rote_navigator.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/players_component.dart';

class PlayersPageView extends StatelessWidget {
  final List<PlayerScore> playersScore;

  const PlayersPageView({super.key, required this.playersScore});

  @override
  Widget build(BuildContext context) {
    final navigator = Modular.get<NewPlayerRouteNavigator>();

    return PlayersComponent(
      playersScore: playersScore,
      goToNextRoute: (route) => navigator.goTo('$route/',
          arguments: route == newPlayerRote ? {"player": Player()} : {}),
      goToUpdatePlayerRoute: (player) =>
          navigator.goTo("$newPlayerRote/", arguments: {"player": player}),
    );
  }
}
