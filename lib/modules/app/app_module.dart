import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_module.dart';
import 'package:team_draw/modules/new_player/routes/new_player_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(startRote, module: AppNavigatorModule()),
        ModuleRoute(newPlayerRote, module: NewPlayerModule())
      ];
}
