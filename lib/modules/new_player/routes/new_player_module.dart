import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view/confirm_new_player_view.dart';
import 'package:team_draw/modules/new_player/view/new_player_base_view.dart';
import 'package:team_draw/modules/new_player/view/overall/player_overall_view.dart';
import 'package:team_draw/modules/new_player/view/player_name_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_principal_position_view.dart';
import 'package:team_draw/modules/new_player/view/player_position/player_secondary_position_view.dart';
import 'package:team_draw/modules/new_player/view/success_view.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';

class NewPlayerModule extends Module {
  static const durationTransaction = 200;

  @override
  void binds(i) {
    i.add(PlayerRepository.new);
    i.add(PlayerViewModel.new);
    i.addLazySingleton(NewPlayerRoutes.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const NewPlayerBaseView(),
      transition: TransitionType.downToUp,
      duration: const Duration(milliseconds: durationTransaction),
      children: [
        ChildRoute(
          nameRoute,
          child: (context) => PlayerNameView(
            player: r.args.data["player"],
            onActionPress: r.args.data["onActionPress"],
          ),
        ),
        ChildRoute(
          principalPositionRoute,
          child: (context) => PlayerPrincipalPositionView(
            player: r.args.data["player"],
            onActionPress: r.args.data["onActionPress"],
          ),
        ),
        ChildRoute(
          secondaryPositionRoute,
          child: (context) => PlayerSecondaryPositionView(
            player: r.args.data["player"],
            onActionPress: r.args.data["onActionPress"],
          ),
        ),
        ChildRoute(
          overallRoute,
          child: (context) => PlayerOverallView(
            player: r.args.data["player"],
            onActionPress: r.args.data["onActionPress"],
          ),
        ),
        ChildRoute(
          confirmNewPlayer,
          child: (_) => ConfirmNewPlayerView(
            player: r.args.data["player"],
          ),
        ),
      ],
    );
    r.child(successNewPlayerRote,
        transition: TransitionType.upToDown, child: (_) => const SuccessView());
  }
}
