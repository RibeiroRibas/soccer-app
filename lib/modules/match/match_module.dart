import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/match/controllers/match_controller.dart';
import 'package:team_draw/modules/match/controllers/match_timer_controller.dart';
import 'package:team_draw/modules/match/controllers/players_controller.dart';
import 'package:team_draw/modules/match/ui/pages/match_page.dart';
import 'package:team_draw/repositories/team_match_repository.dart';
import 'package:team_draw/repositories/player_repository.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';
import 'package:team_draw/shared/routes/route_named.dart';

class MatchModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(MatchController.new);
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(PlayersOneController.new);
    i.addSingleton(PlayersTwoController.new);
    i.addSingleton(MatchTimerController.new);
    i.addSingleton(PlayerRepository.new);
    i.addSingleton(PlayerService.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => MatchPage(
        matches: r.args.data["matches"],
        matchSettings: r.args.data["matchSettings"],
      ),
    );
  }
}
