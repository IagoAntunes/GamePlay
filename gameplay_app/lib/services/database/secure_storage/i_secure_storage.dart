abstract class ISecureStorage {
  Future<T?> get<T>(String key);
  Future<T?> set<T>(String key, T value);
}
