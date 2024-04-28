import 'package:localstorage/localstorage.dart';
import 'package:team_draw/modules/app/repository/local_repository.dart';

const localRepositoryKey = "team_data";

class LocalStorageRepository extends ILocalRepository {

  @override
  Future<String?> read(String key) async {
    await initLocalStorage();
    return localStorage.getItem(key);
  }

  @override
  Future<void> write(String key, String value) async {
    await initLocalStorage();
    localStorage.setItem(key, value);
  }
}
