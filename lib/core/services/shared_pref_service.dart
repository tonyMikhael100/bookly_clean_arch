import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Singleton instance
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  factory SharedPrefsService() => _instance;
  SharedPrefsService._internal();

  static SharedPreferences? _prefs;

  /// Initialize once in main()
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Save data (auto type handling)
  Future<void> setValue(String key, dynamic value) async {
    if (_prefs == null) return;

    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  /// Get value safely (returns `null` if key doesn't exist)
  T? getValue<T>(String key) {
    if (_prefs == null) return null;
    final value = _prefs!.get(key);
    if (value is T) return value;
    return null;
  }

  /// Remove specific key
  Future<void> remove(String key) async {
    if (_prefs == null) return;
    await _prefs!.remove(key);
  }

  /// Clear all preferences
  Future<void> clear() async {
    if (_prefs == null) return;
    await _prefs!.clear();
  }

  /// Check if key exists
  bool containsKey(String key) {
    if (_prefs == null) return false;
    return _prefs!.containsKey(key);
  }
}
