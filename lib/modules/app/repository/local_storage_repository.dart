import 'package:localstorage/localstorage.dart';
import 'package:team_draw/modules/app/repository/local_repository.dart';

const localRepositoryKey = "team_data";

class LocalStorageRepository extends ILocalRepository {
  final LocalStorage _storage = LocalStorage(localRepositoryKey);

  @override
  Future<V?> read<V>(String key) async {
    await _storage.ready;
    return _storage.getItem(key) as V?;
  }

  @override
  Future<void> write<V>(String key, V value) async {
    await _storage.ready;
    _storage.setItem(key, value);
  }
}
