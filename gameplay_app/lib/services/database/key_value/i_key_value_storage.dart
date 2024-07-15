abstract class IKeyValueStorage {
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value);
}
