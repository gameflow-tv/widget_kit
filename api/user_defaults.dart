import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class UserDefaultsAPI {
  void setAppGroup(String appGroup);
  Object? get(String key, String? appGroup);
  String? getString(String key, String? appGroup);
  bool? getBool(String key, String? appGroup);
  int? getInt(String key, String? appGroup);
  double? getDouble(String key, String? appGroup);
  Map? getMap(String key, String? appGroup);
  void set(String key, Object value, String? appGroup);
  void setString(String key, String value, String? appGroup);
  void setBool(String key, bool value, String? appGroup);
  void setInt(String key, int value, String? appGroup);
  void setDouble(String key, double value, String? appGroup);
  void setMap(String key, Map value, String? appGroup);
  void remove(String key, String? appGroup);
  bool contains(String key, String? appGroup);
}
