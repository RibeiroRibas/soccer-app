import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app_navigator/repository/app_navigator_repository.dart';
import 'package:team_draw/modules/app_navigator/routes/app_navigator_rotes.dart';
import 'package:team_draw/modules/app_navigator/routes/route_navigator.dart';
import 'package:team_draw/modules/app_navigator/view/app_navigator_view.dart';
import 'package:team_draw/modules/app_navigator/view/home_view.dart';
import 'package:team_draw/modules/app_navigator/view/players/players_view.dart';
import 'package:team_draw/modules/app_navigator/view/teams_view.dart';
import 'package:team_draw/modules/app_navigator/view_model/app_navigator_view_model.dart';

import 'route_named.dart';

class AppNavigatorModule extends Module {
  static const durationTransaction = 500;

  @override
  List<Bind> get binds => [
        Bind.factory((i) => AppNavigatorRepository()),
        Bind.singleton((i) => AppNavigatorViewModel(i())),
        Bind.lazySingleton<RouteNavigator>((i) => AppNavigatorRoutes())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(appRoute,
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
              RedirectRoute(redirectRoute, to: homeRoute),
            ])
      ];
}
