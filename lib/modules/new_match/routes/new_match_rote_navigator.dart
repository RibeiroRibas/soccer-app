import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/shared/route_navigator.dart';

class NewMatchRoteNavigator extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, dynamic arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  void nextRouteFromIndex(int index, Map<String, dynamic> arguments) {
    String routeName = startRote;
    switch (index) {
      case -1:
        routeName = startRote;
      case 0:
        routeName = '$newMatchRote$playerLineupRote';
        break;
      case 1:
        routeName = '$newMatchRote$matchSettingsRoute';
        break;
    }
    goTo(routeName, arguments);
  }
}
