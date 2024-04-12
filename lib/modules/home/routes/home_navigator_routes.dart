import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/shared/route_navigator.dart';

class HomeNavigatorRoutes extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, Map<String, dynamic>? arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  void nextRouteFromIndex(int index, Map<String, dynamic>? arguments) {
    String routeName = startRote;
    switch (index) {
      case 0:
        routeName = '$homeNavBarRoute$homeRoute';
        break;
      case 1:
        routeName = '$homeNavBarRoute$teamsRoute';
        break;
      case 2:
        routeName = '$homeNavBarRoute$playersRoute';
        break;
    }
    goTo(routeName, arguments);
  }
}
