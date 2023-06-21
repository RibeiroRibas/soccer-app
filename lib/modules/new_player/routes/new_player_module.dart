import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/new_player_success_view.dart';
import 'package:team_draw/modules/new_player/view/player_name_view.dart';
import 'package:team_draw/modules/new_player/view/player_overall_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_principal_position_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_secondary_position_view.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/route_navigator.dart';
import 'package:team_draw/modules/new_player/view/new_player_view.dart';

class NewPlayerModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Bind> get binds => [
        Bind.factory((i) => NewPlayerRepository()),
        Bind.singleton((i) => PlayerViewModel(i())),
        Bind.lazySingleton<RouteNavigator>((i) => NewPlayerRoutes())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(startRote,
            child: (context, args) => const NewPlayerView(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: durationTransaction),
            children: [
              ChildRoute(
                nameRoute,
                child: (context, args) => const PlayerNameView(),
              ),
              ChildRoute(
                principalPositionRoute,
                child: (context, args) => const PlayerPrincipalPositionView(),
              ),
              ChildRoute(
                secondaryPositionRoute,
                child: (context, args) => const PlayerSecondaryPositionView(),
              ),
              ChildRoute(
                overallRoute,
                child: (context, args) => const PlayerOverallView(),
              ),
            ]),
        ChildRoute(
          successNewPlayerRote,
          child: (_, args) => const NewPlayerSuccessView(),
          transition: TransitionType.upToDown,
          duration: const Duration(milliseconds: 500),
        )
      ];
}
