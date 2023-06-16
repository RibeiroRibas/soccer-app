abstract class RouteNavigator {
  Future<void>goTo(String routeName, Map<String, dynamic>? arguments);
  Future<Map<String, dynamic>> goBack(String routeName, Map<String, dynamic>? arguments);
}