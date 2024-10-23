import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String _authTokrnkey = '';

  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await prefs.setString(_authTokrnkey, token);
  }

  static Future<void> logout() async {
    await prefs.remove(_authTokrnkey);
  }
}
