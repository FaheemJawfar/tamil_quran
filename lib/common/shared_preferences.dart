import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  static void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  static String? getString(String key) => _prefs.getString(key);

  static List<String>? getStringList(String key) => _prefs.getStringList(key);
  static int? getInt(String key) => _prefs.getInt(key);

  static double? getDouble(String key) => _prefs.getDouble(key);

  static bool? getBool(String key) => _prefs.getBool(key);


  static Future<bool> clear() => _prefs.clear();
}
