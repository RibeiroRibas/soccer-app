import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_module.dart';
import 'package:team_draw/modules/new_match/routes/new_match_module.dart';
import 'package:team_draw/modules/new_player/routes/new_player_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(startRote, module: AppNavigatorModule());
    r.module(newPlayerRote, module: NewPlayerModule());
    r.module(newMatchRote, module: NewMatchModule());
  }
}
