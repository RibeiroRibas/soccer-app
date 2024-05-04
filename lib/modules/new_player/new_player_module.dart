import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/new_player_base_view.dart';
import 'package:team_draw/modules/new_player/view/success_view.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/repository/match_repository.dart';
import 'package:team_draw/services/team_match_service.dart';

class NewPlayerModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(PlayerViewModel.new);
    i.addLazySingleton(NewPlayerRoutes.new);
  }

  @override
  void routes(r) {
    r.child(startRote,
        child: (context) => NewPlayerBaseView(player: r.args.data["player"]));
    r.child(successNewPlayerRote,
        transition: TransitionType.upToDown,
        child: (_) => SuccessView(playersScore: r.args.data["playersScore"]));
  }
}
