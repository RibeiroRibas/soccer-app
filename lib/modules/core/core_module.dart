import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/repositories/player_repository.dart';
import 'package:team_draw/shared/services/local_storage_service.dart';
import 'package:team_draw/shared/services/player_service.dart';
import 'package:team_draw/shared/controller/page_view_controller.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(PlayerRepository.new);
    i.addLazySingleton(PlayerService.new);
    i.add(PageController.new);
    i.add(PageViewController.new);
    i.addLazySingleton(LocalStorageService.new);
    i.addLazySingleton(LocalStorageRepository.new);
  }
}
