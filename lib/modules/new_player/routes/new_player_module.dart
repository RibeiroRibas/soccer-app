import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/confirm_new_player_view.dart';
import 'package:team_draw/modules/new_player/view/player_name_view.dart';
import 'package:team_draw/modules/new_player/view/overall/player_overall_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_principal_position_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_secondary_position_view.dart';
import 'package:team_draw/modules/new_player/view/success_view.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/route_navigator.dart';
import 'package:team_draw/modules/new_player/view/new_player_view.dart';

class NewPlayerModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Bind> get binds => [
        Bind.factory((i) => PlayerRepository()),
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
                child: (context, args) => PlayerNameView(
                  player: args.data["player"],
                  onActionPress: args.data["onActionPress"],
                ),
              ),
              ChildRoute(
                principalPositionRoute,
                child: (context, args) => PlayerPrincipalPositionView(
                  player: args.data["player"],
                  onActionPress: args.data["onActionPress"],
                ),
              ),
              ChildRoute(
                secondaryPositionRoute,
                child: (context, args) => PlayerSecondaryPositionView(
                  player: args.data["player"],
                  onActionPress: args.data["onActionPress"],
                ),
              ),
              ChildRoute(
                overallRoute,
                child: (context, args) => PlayerOverallView(
                  player: args.data["player"],
                  onActionPress: args.data["onActionPress"],
                ),
              ),
              ChildRoute(
                confirmNewPlayer,
                child: (_, args) => ConfirmNewPlayerView(
                  player: args.data["player"],
                ),
              ),
            ]),
        ChildRoute(successNewPlayerRote,
            transition: TransitionType.upToDown,
            child: (_, args) => const SuccessView()),
      ];
}
