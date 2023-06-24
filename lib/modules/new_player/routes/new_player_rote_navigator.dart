import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/shared/route_navigator.dart';

class NewPlayerRoutes extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, dynamic arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  void nextRouteFromIndex(int index, Map<String, dynamic> arguments) {
    String routeName = startRote;
    switch (index) {
      case 0:
        routeName = '$newPlayerRote$nameRoute';
        break;
      case 1:
        routeName = '$newPlayerRote$principalPositionRoute';
        break;
      case 2:
        routeName = '$newPlayerRote$secondaryPositionRoute';
        break;
      case 3:
        routeName = '$newPlayerRote$overallRoute';
        break;
      case 4:
        routeName = '$newPlayerRote$confirmNewPlayer';
    }
    goTo(routeName, arguments);
  }
}
