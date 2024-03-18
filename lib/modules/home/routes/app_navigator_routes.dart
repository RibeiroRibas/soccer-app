import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/shared/route_navigator.dart';

class AppNavigatorRoutes extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, Map<String, dynamic>? arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }
}
