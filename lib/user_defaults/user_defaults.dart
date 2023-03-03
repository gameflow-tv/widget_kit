import 'platform_interface.dart';

/// Surface level API for the user defaults plugin.
class UserDefaults {
  /// Returns the value associated with [key] or `null` if no value is
  /// associated with [key].
  static Future<dynamic> get(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.get(key, appGroup);
  }

  /// Returns the value associated with [key] or `null` if no value is
  /// associated with [key].
  static Future<String?> getString(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.getString(key, appGroup);
  }

  /// Returns the value associated with [key] or `null` if no value is
  /// associated with [key].
  static Future<bool?> getBool(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.getBool(key, appGroup);
  }

  /// Returns the value associated with [key] or `null` if no value is
  /// associated with [key].
  static Future<int?> getInt(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.getInt(key, appGroup);
  }

  /// Returns the value associated with [key] or `null` if no value is
  /// associated with [key].
  static Future<double?> getDouble(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.getDouble(key, appGroup);
  }

  /// Stores [value] in the user defaults key-value store.
  static Future<void> set(String key, dynamic value, String appGroup) async {
    return UserDefaultsPlatform.instance.set(key, value, appGroup);
  }

  /// Stores [value] in the user defaults key-value store.
  static Future<void> setString(
    String key,
    String value,
    String appGroup,
  ) async {
    return UserDefaultsPlatform.instance.setString(key, value, appGroup);
  }

  /// Stores [value] in the user defaults key-value store.
  static Future<void> setBool(
    String key,
    bool value,
    String appGroup,
  ) async {
    return UserDefaultsPlatform.instance.setBool(key, value, appGroup);
  }

  /// Stores [value] in the user defaults key-value store.
  static Future<void> setInt(
    String key,
    int value,
    String appGroup,
  ) async {
    return UserDefaultsPlatform.instance.setInt(key, value, appGroup);
  }

  /// Stores [value] in the user defaults key-value store.
  static Future<void> setDouble(
    String key,
    double value,
    String appGroup,
  ) async {
    return UserDefaultsPlatform.instance.setDouble(key, value, appGroup);
  }

  /// Removes the value associated with [key] from the user defaults
  static Future<bool> remove(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.remove(key, appGroup);
  }

  /// Returns `true` if the user defaults contains a value associated with [key].
  static Future<bool> contains(String key, String appGroup) async {
    return UserDefaultsPlatform.instance.contains(key, appGroup);
  }
}
