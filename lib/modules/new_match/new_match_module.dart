import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/new_match/controllers/draw_teams_controller.dart';
import 'package:team_draw/modules/new_match/controllers/match_settings_controller.dart';
import 'package:team_draw/modules/new_match/controllers/new_match_nav_bar_controller.dart';
import 'package:team_draw/modules/new_match/controllers/player_lineup_controller.dart';
import 'package:team_draw/modules/new_match/controllers/result_match_conotroller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/repositories/match_settings_repository.dart';
import 'package:team_draw/modules/new_match/services/draw_teams_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_name_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_shield_service.dart';
import 'package:team_draw/modules/new_match/services/match_settings_service.dart';
import 'package:team_draw/modules/new_match/ui/pages/new_match_nav_bar.dart';
import 'package:team_draw/modules/new_match/ui/pages/result_match_page.dart';
import 'package:team_draw/services/team_service.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/repositories/team_repository.dart';
import 'package:team_draw/shared/routes/route_named.dart';

class NewMatchModule extends Module {
  static const durationTransaction = 500;

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addLazySingleton(TeamRepository.new);
    i.addLazySingleton(TeamService.new);
    i.addLazySingleton(DrawTeamsService.new);
    i.addLazySingleton(GenerateTeamNameService.new);
    i.addLazySingleton(GenerateTeamShieldService.new);
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(NewMatchRoteNavigator.new);
    i.addLazySingleton(NewMatchNavBarController.new);
    i.addLazySingleton(DrawTeamsController.new);
    i.addLazySingleton(MatchSettingsService.new);
    i.addLazySingleton(MatchSettingsRepository.new);
    i.addLazySingleton(ResultMatchController.new);
    i.addSingleton(MatchSettingsController.new);
    i.addSingleton(PlayerLineupController.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const NewMatchNavBar(),
    );
    r.child(
      resultMatchRoute,
      child: (context) => ResultMatchPage(
          matches: r.args.data["matches"],
          matchSettings: r.args.data["matchSettings"]),
    );
  }
}
