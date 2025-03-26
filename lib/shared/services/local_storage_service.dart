import 'package:team_draw/shared/repositories/local_repository.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';

class LocalStorageService extends ILocalRepository {
  final LocalStorageRepository _repository;

  LocalStorageService(this._repository);

  @override
  Future<String?> read(String key) async {
    return await _repository.read(key);
  }

  @override
  Future<void> write(String key, String value) async {
    return await _repository.write(key, value);
  }
}
