import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/theme/controllers/theme_controller.dart';
import 'package:team_draw/modules/theme/pages/initial_page.dart';
import 'package:team_draw/modules/theme/pages/select_theme_page.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/theme_route_navigator.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/services/local_storage_service.dart';

class ThemeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(LocalStorageService.new);
    i.addSingleton(LocalStorageRepository.new);
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeController.new);
    i.addLazySingleton(ThemeRouteNavigator.new);
  }

  @override
  void routes(r) {
    r.child(startRote, child: (_) => const InitialPage());
    r.child(selectThemeRoute, child: (_) => const SelectThemePage());
  }
}
