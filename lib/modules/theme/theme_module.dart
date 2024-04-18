import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/theme_navigator_rotes.dart';
import 'package:team_draw/modules/theme/theme_view_model/theme_view_model.dart';
import 'package:team_draw/modules/theme/ui/initial_view.dart';
import 'package:team_draw/modules/theme/ui/select_theme_view.dart';

class ThemeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(LocalStorageRepository.new);
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeViewModel.new);
    i.addLazySingleton(ThemeNavigatorRotes.new);
  }

  @override
  void routes(r) {
    r.child(startRote, child: (_) => const InitialView());
    r.child(selectThemeRoute, child: (_) => const SelectThemeView());
  }
}
