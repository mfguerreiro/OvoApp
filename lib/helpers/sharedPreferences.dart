import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static SharedPreferences? preferences;
  static bool _init = false;

  Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  getString(key) {
    return preferences!.getString(key);
  }

  getInt(key) {
    return preferences!.getInt(key);
  }

  getBoolean(key) {
    // final prefs = await SharedPreferences.getInstance();
    return preferences!.getBool(key);
  }

  setString(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setInt(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  setDouble(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  setBoolean(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  clearAll() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }
}
