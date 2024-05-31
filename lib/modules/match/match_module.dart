import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/match/ui/view/match_view.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_two_view_model.dart';
import 'package:team_draw/modules/new_player/repository/player_repository.dart';
import 'package:team_draw/repository/match_repository.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';

class MatchModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(MatchViewModel.new);
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(PlayersOneViewModel.new);
    i.addSingleton(PlayersTwoViewModel.new);
    i.addSingleton(MatchTimerViewModel.new);
    i.addSingleton(PlayerRepository.new);
    i.addSingleton(PlayerService.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => MatchView(
        matches: r.args.data["matches"],
        matchSettings: r.args.data["matchSettings"],
      ),
    );
  }
}
