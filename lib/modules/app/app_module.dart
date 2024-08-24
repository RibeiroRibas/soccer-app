import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/theme/controllers/theme_controller.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/gallery/gallery_module.dart';
import 'package:team_draw/modules/home/home_module.dart';
import 'package:team_draw/modules/match/match_module.dart';
import 'package:team_draw/modules/new_match/new_match_module.dart';
import 'package:team_draw/modules/new_player/new_player_module.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/theme_module.dart';
import 'package:team_draw/shared/services/local_storage_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(LocalStorageRepository.new);
    i.addSingleton(LocalStorageService.new);
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeController.new);
  }

  @override
  void routes(r) {
    r.module(startRote, module: ThemeModule());
    r.module(galleryRoute, module: GalleryModule());
    r.module(homeNavBarRoute, module: HomeModule());
    r.module(newPlayerRote, module: NewPlayerModule());
    r.module(newMatchRote, module: NewMatchModule());
    r.module(matchRote, module: MatchModule());
  }
}
