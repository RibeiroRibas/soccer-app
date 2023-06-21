import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/shared/route_navigator.dart';

class NewPlayerRoutes extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, dynamic arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  void backRouteFromIndex(int index) {
    String routeName = startRote;
    switch (index) {
      case 0:
        routeName = startRote;
        break;
      case 1:
        routeName = '$newPlayerRote$nameRoute';
        break;
      case 2:
        routeName = '$newPlayerRote$principalPositionRoute';
        break;
      case 3:
        routeName = '$newPlayerRote$secondaryPositionRoute';
    }
    goTo(routeName, null);
  }

  void nextRouteFromIndex(int index) {
    String routeName = startRote;
    switch (index) {
      case 0:
        routeName = '$newPlayerRote$principalPositionRoute';
        break;
      case 1:
        routeName = '$newPlayerRote$secondaryPositionRoute';
        break;
      case 2:
        routeName = '$newPlayerRote$overallRoute';
        break;
    }
    goTo(routeName, null);
  }
}
