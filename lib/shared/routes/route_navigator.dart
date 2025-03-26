abstract class RouteNavigator {
  Future<void> goTo(String routeName, {Map<String, dynamic>? arguments});
  Future<void> pushNamed(String routeName, {Map<String, dynamic>? arguments});
  Future<void> pop();
}
