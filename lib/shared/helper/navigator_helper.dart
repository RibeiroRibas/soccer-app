import 'package:flutter_modular/flutter_modular.dart';

class NavigatorHelper {
  static String? getFirstRouteHistory() {
    var history = Modular.to.navigateHistory;
    return history.isEmpty ? null : history.first.name;
  }
}
