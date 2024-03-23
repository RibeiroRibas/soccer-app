abstract class ILocalRepository {
  Future<V?> read<V>(String key);

  Future<void> write<V>(String key, V value);
}
