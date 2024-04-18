import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/new_match/routes/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/services/generate_team_name_service.dart';
import 'package:team_draw/modules/new_match/services/generate_team_shield_service.dart';
import 'package:team_draw/modules/new_match/services/sort_teams_service.dart';
import 'package:team_draw/modules/new_match/view/new_match_base_view.dart';
import 'package:team_draw/modules/new_match/view_model/draw_teams_view_model.dart';
import 'package:team_draw/modules/new_match/view_model/match_settings_view_model.dart';
import 'package:team_draw/modules/new_match/view_model/player_lineup_view_model.dart';
import 'package:team_draw/services/team_service.dart';

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
    i.addLazySingleton(SortTeamsService.new);
    i.addLazySingleton(GenerateTeamNameService.new);
    i.addLazySingleton(GenerateTeamShieldService.new);
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(NewMatchRoteNavigator.new);
    i.addLazySingleton(DrawTeamsViewModel.new);
    i.addSingleton(MatchSettingsViewModel.new);
    i.addSingleton(PlayerLineupViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const NewMatchBaseView(),
    );
  }
}
