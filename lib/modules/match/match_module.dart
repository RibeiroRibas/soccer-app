import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/match/view/match_view.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_view_model.dart';

class MatchModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(MatchViewModel.new);
    i.addSingleton(ReservePlayerViewModel.new);
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
