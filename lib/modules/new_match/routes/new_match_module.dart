import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_match/repository/new_match_repository.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/services/sort_teams_service.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/draw_teams_view.dart';
import 'package:team_draw/modules/new_match/view/match_settings/match_settings_view.dart';
import 'package:team_draw/modules/new_match/view/new_match_base_view.dart';
import 'package:team_draw/modules/new_match/view/player_lineup/players_lineup_view.dart';
import 'package:team_draw/modules/new_match/view_model/draw_teams_view_model.dart';
import 'package:team_draw/modules/new_match/view_model/match_settings_view_model.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/modules/new_match/view_model/player_lineup_view_model.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';

class NewMatchModule extends Module {
  static const durationTransaction = 500;

  @override
  void binds(i) {
    i.add(PlayerRepository.new);
    i.add(TeamRepository.new);
    i.add(NewMatchRepository.new);
    i.add(NewMatchViewModel.new);
    i.add(SortTeamsService.new);
    i.addSingleton(DrawTeamsViewModel.new);
    i.addLazySingleton(NewMatchRoteNavigator.new);
    i.addLazySingleton(MatchSettingsViewModel.new);
    i.addLazySingleton(PlayerLineupViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const NewMatchBaseView(),
      transition: TransitionType.noTransition,
      duration: const Duration(milliseconds: durationTransaction),
      children: [
        ChildRoute(
          playerLineupRote,
          child: (context) => PlayersLineupView(
            selectedPlayers: r.args.data["selectedPlayers"],
            matchSettings: r.args.data["matchSettings"],
          ),
        ),
        ChildRoute(
          matchSettingsRoute,
          child: (context) => MatchSettingsView(
            selectedPlayers: r.args.data["selectedPlayers"],
            matchSettings: r.args.data["matchSettings"],
          ),
        ),
        ChildRoute(
          drawnTeamsRote,
          child: (context) => DrawnTeamsView(
            selectedPlayers: r.args.data["selectedPlayers"],
            matchSettings: r.args.data["matchSettings"],
          ),
        ),
      ],
    );
  }
}
