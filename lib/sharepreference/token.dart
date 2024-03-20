import 'package:task_intern_5_flutter/import.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) {
    return storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() {
    return storage.read(key: 'token');
  }

  static Future<void> saveRefreshToken(String token) {
    return storage.write(key: 'refresh_token', value: token);
  }

  static Future<String?> getRefreshToken() {
    return storage.read(key: 'refresh_token');
  }

  static Future<void> clear() {
    return storage.deleteAll();
  }
}