import 'package:gameplay_app/services/database/key_value/i_key_value_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements IKeyValueStorage {
  @override
  Future<T?> get<T>(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.get(key);

    if (value is T) {
      return value;
    } else {
      return null;
    }
  }

  @override
  Future<void> set<T>(String key, T value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (T is String) {
      await sharedPreferences.setString(key, value as String);
    } else if (T is int) {
      await sharedPreferences.setInt(key, value as int);
    } else if (T is double) {
      await sharedPreferences.setDouble(key, value as double);
    } else if (T is bool) {
      await sharedPreferences.setBool(key, value as bool);
    } else if (T is List<String>) {
      await sharedPreferences.setStringList(key, value as List<String>);
    }
  }
}
