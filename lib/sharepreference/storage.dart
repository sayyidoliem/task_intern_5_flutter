import 'package:task_intern_5_flutter/import.dart';

class UserStorage {
  static Future<void> saveUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  static Future<void> saveEmail(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', password);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future<void> savePhone(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', password);
  }

  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone');
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
