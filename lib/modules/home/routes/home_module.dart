import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/repository/home_repository.dart';
import 'package:team_draw/modules/home/routes/home_rote_navigator.dart';
import 'package:team_draw/shared/route_navigator.dart';
import 'package:team_draw/modules/home/view/app_navigator_view.dart';
import 'package:team_draw/modules/home/view/home_view.dart';
import 'package:team_draw/modules/home/view/players/players_view.dart';
import 'package:team_draw/modules/home/view/teams_view.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';

class AppNavigatorModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeRepository()),
        Bind.singleton((i) => HomeViewModel(i())),
        Bind.lazySingleton<RouteNavigator>((i) => AppNavigatorRoutes())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          startRote,
          child: (context, args) => const AppNavigatorView(),
          children: [
            ChildRoute(
              homeRoute,
              child: (context, args) => HomeView(
                teamsScore: args.data["teamsScore"],
                allMatches: args.data["allMatches"],
              ),
              transition: TransitionType.leftToRight,
              duration: const Duration(milliseconds: durationTransaction),
            ),
            ChildRoute(
              teamsRoute,
              child: (context, args) => TeamsView(
                teamsOverall: args.data["teamsOverall"],
                allMatches: args.data["allMatches"],
              ),
              transition: TransitionType.downToUp,
              duration: const Duration(milliseconds: durationTransaction),
            ),
            ChildRoute(
              playersRoute,
              child: (context, args) => PlayersView(
                playersScore: args.data["playersScore"],
              ),
              transition: TransitionType.rightToLeft,
              duration: const Duration(milliseconds: durationTransaction),
            ),
          ],
        ),
      ];
}
