import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view/home_nav_bar_base_view.dart';
import 'package:team_draw/modules/home/view_model/expandable_button_controller.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/modules/new_player/repository/player_repository.dart';
import 'package:team_draw/repository/match_repository.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';
import 'package:team_draw/services/team_service.dart';

class HomeModule extends Module {
  static const durationTransaction = 200;

  @override
  void binds(i) {
    i.add(PlayerRepository.new);
    i.add(TeamRepository.new);
    i.add(TeamMatchRepository.new);
    i.add(PlayerService.new);
    i.add(TeamMatchService.new);
    i.add(TeamService.new);
    i.addSingleton(HomeViewModel.new);
    i.addSingleton(ExpandableButtonController.new);
    i.addLazySingleton(HomeNavigatorRoutes.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const HomeNavBarBaseView(),
    );
  }
}
