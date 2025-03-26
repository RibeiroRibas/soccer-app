import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/new_player/controllers/new_player_controller.dart';
import 'package:team_draw/modules/new_player/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/ui/pages/new_player_nav_bar.dart';
import 'package:team_draw/modules/new_player/ui/pages/success_page.dart';
import 'package:team_draw/shared/repositories/team_match_repository.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/services/team_match_service.dart';

class NewPlayerModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(NewPlayerController.new);
    i.addLazySingleton(NewPlayerRouteNavigator.new);
  }

  @override
  void routes(r) {
    r.child(startRote,
        child: (context) => NewPlayerNavBar(player: r.args.data["player"]));
    r.child(successNewPlayerRote,
        transition: TransitionType.upToDown,
        child: (_) => SuccessView(playersScore: r.args.data["playersScore"]));
  }
}
