import 'package:flutter/material.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/modules/theme/theme_name.dart';
import 'package:team_draw/shared/theme/theme_resolve.dart';

class ThemeRepository {
  final LocalStorageRepository themeRepository;

  ThemeRepository(this.themeRepository);

  final _themeRepositoryKey = "theme";

  Future<ThemeData?> loadFromStorage() async {
    String? theme = await themeRepository.read(_themeRepositoryKey);
    return theme != null ? ThemeResolve.fromName(theme) : null;
  }

  Future<void> writeData(ThemeName themeName) async {
    await themeRepository.write(_themeRepositoryKey, themeName.name);
  }
}
