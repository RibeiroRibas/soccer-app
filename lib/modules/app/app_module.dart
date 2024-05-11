import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/gallery/gallery_module.dart';
import 'package:team_draw/modules/home/home_module.dart';
import 'package:team_draw/modules/match/match_module.dart';
import 'package:team_draw/modules/new_match/new_match_module.dart';
import 'package:team_draw/modules/new_player/new_player_module.dart';
import 'package:team_draw/modules/theme/repository/theme_repository.dart';
import 'package:team_draw/modules/theme/theme_module.dart';
import 'package:team_draw/modules/theme/theme_view_model/theme_view_model.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(LocalStorageRepository.new);
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeViewModel.new);
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
