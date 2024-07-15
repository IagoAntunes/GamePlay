import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';

class SecureStorage implements ISecureStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<T?> get<T>(String key) async {
    var value = await _storage.read(key: key);

    if (T == String && value != null) {
      return value as T?;
    }

    //Personalized treatment
    if (value != null) {
      try {
        if (T == int) {
          return int.parse(value) as T?;
        } else if (T == double) {
          return double.parse(value) as T?;
        } else if (T == bool) {
          return (value.toLowerCase() == 'true') as T?;
        }
      } catch (e) {
        log('Error converting value to type T: $e');
        return null;
      }
    }

    return null;
  }

  @override
  Future<T?> set<T>(String key, T value) async {
    if (T == String) {
      await _storage.write(key: key, value: value as String);
    } else {
      //Personalized treatment
      await _storage.write(key: key, value: value.toString());
    }
    return null;
  }
}
