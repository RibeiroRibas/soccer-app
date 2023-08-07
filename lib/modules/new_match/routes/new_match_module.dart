import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_match/repository/new_match_repository.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/view/draw_teams_view.dart';
import 'package:team_draw/modules/new_match/view/match_settings/match_settings_view.dart';
import 'package:team_draw/modules/new_match/view/new_match_view.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/players_lineup_view.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/shared/route_navigator.dart';

class NewMatchModule extends Module {
  static const durationTransaction = 500;

  @override
  List<Bind> get binds => [
        Bind.factory((i) => NewMatchRepository()),
        Bind.singleton((i) => NewMatchViewModel(i())),
        Bind.lazySingleton<RouteNavigator>((i) => NewMatchRoteNavigator())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(startRote,
            child: (context, args) => const NewMatchView(),
            transition: TransitionType.rightToLeft,
            duration: const Duration(milliseconds: durationTransaction),
            children: [
              ChildRoute(
                playerLineupRote,
                child: (context, args) => PlayersLineupView(
                  selectedPlayers: args.data["selectedPlayers"],
                  matchSettings: args.data["matchSettings"],
                ),
              ),
              ChildRoute(
                matchSettingsRoute,
                child: (context, args) => MatchSettingsView(
                  selectedPlayers: args.data["selectedPlayers"],
                  matchSettings: args.data["matchSettings"],
                ),
              ),
              ChildRoute(
                drawnTeamsRote,
                child: (context, args) => DrawnTeamsView(
                  selectedPlayers: args.data["selectedPlayers"],
                  matchSettings: args.data["matchSettings"],
                ),
              ),
            ]),
      ];
}
