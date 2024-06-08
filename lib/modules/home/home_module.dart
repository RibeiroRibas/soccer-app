import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/home/controllers//expandable_button_controller.dart';
import 'package:team_draw/modules/home/controllers/home_controller.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/modules/home/ui/home_nav_bar.dart';
import 'package:team_draw/repositories/team_match_repository.dart';
import 'package:team_draw/services/media_service.dart';
import 'package:team_draw/services/team_match_service.dart';
import 'package:team_draw/services/team_service.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/repositories/team_repository.dart';
import 'package:team_draw/shared/routes/route_named.dart';

class HomeModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton(TeamRepository.new);
    i.addSingleton(TeamService.new);
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(HomeController.new);
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(ExpandableButtonController.new);
    i.addLazySingleton(ImagePicker.new);
    i.addLazySingleton(DrawerController.new);
    i.add(MediaService.new);
    i.addLazySingleton(HomeRouteNavigator.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const HomeNavBar(),
    );
  }
}
