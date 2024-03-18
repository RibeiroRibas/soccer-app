import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/repository/home_repository.dart';
import 'package:team_draw/modules/home/routes/app_navigator_routes.dart';
import 'package:team_draw/modules/home/view/app_navigator_base_view.dart';
import 'package:team_draw/modules/home/view/home_view.dart';
import 'package:team_draw/modules/home/view/players/players_view.dart';
import 'package:team_draw/modules/home/view/teams_view.dart';
import 'package:team_draw/modules/home/view_model/expandable_button_controller.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';

class AppNavigatorModule extends Module {
  static const durationTransaction = 200;

  @override
  void binds(i) {
    i.add(HomeRepository.new);
    i.addSingleton(HomeViewModel.new);
    i.addSingleton(ExpandableButtonController.new);
    i.addLazySingleton(AppNavigatorRoutes.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const AppNavigatorBaseView(),
      children: [
        ChildRoute(
          homeRoute,
          child: (context) => HomeView(
            teamsScore: r.args.data["teamsScore"],
            allMatches: r.args.data["allMatches"],
          ),
          transition: TransitionType.leftToRight,
          duration: const Duration(milliseconds: durationTransaction),
        ),
        ChildRoute(
          teamsRoute,
          child: (context) => TeamsView(
            teams: r.args.data["teams"],
            allMatches: r.args.data["allMatches"],
          ),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: durationTransaction),
        ),
        ChildRoute(
          playersRoute,
          child: (context) => PlayersView(
            playersScore: r.args.data["playersScore"],
          ),
          transition: TransitionType.rightToLeft,
          duration: const Duration(milliseconds: durationTransaction),
        ),
      ],
    );
  }
}
