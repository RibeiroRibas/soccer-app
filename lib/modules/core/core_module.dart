import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/theme_view_model/theme_view_model.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.add(LocalStorageRepository.new);
    i.add(ThemeRepository.new);
    i.addSingleton(ThemeViewModel.new);
  }
}
