import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app_navigator/routes/route_navigator.dart';

class AppNavigatorRoutes extends RouteNavigator {
  @override
  Future<Map<String, dynamic>> goBack(
      String routeName, Map<String, dynamic>? arguments) {
    // TODO: implement goBack
    throw UnimplementedError();
  }

  @override
  Future<void> goTo(String routeName, Map<String, dynamic>? arguments) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }
}
