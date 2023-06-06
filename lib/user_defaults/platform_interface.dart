import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel.dart';

abstract class UserDefaultsPlatform extends PlatformInterface {
  /// Constructs a UserDefaultsPlatform.
  UserDefaultsPlatform() : super(token: _token);

  static final Object _token = Object();

  static UserDefaultsPlatform _instance = MethodChannelUserDefaults();

  /// The default instance of [UserDefaultsPlatform] to use.
  ///
  /// Defaults to [MethodChannelUserDefaults].
  static UserDefaultsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WidgetKitPlatform] when
  /// they register themselves.
  static set instance(UserDefaultsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// The app group used to share data between the app and its extensions.
  /// If this isn't set, the app group will need to be provided when calling
  /// each method.
  static set appGroup(String? appGroup) {
    _instance = MethodChannelUserDefaults(appGroup);
  }

  /// Retrieves the value associated with [key] from the user defaults.
  Future<dynamic> get(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('get() has not been implemented.');
  }

  /// Retrieves the value associated with [key] from the user defaults.
  Future<bool?> getBool(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('getBool() has not been implemented.');
  }

  /// Retrieves the value associated with [key] from the user defaults.
  Future<int?> getInt(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('getInt() has not been implemented.');
  }

  /// Retrieves the value associated with [key] from the user defaults.
  Future<double?> getDouble(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('getDouble() has not been implemented.');
  }

  /// Retrieves the value associated with [key] from the user defaults.
  Future<String?> getString(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('getString() has not been implemented.');
  }

  /// Stores [value] in the user defaults key-value store and associates it
  /// with [key].
  Future<void> set(
    String key,
    dynamic value, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('setItem() has not been implemented.');
  }

  /// Stores [value] in the user defaults key-value store and associates it
  /// with [key].
  Future<void> setBool(
    String key,
    bool value, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('setBool() has not been implemented.');
  }

  /// Stores [value] in the user defaults key-value store and associates it
  /// with [key].
  Future<void> setInt(
    String key,
    int value, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('setInt() has not been implemented.');
  }

  /// Stores [value] in the user defaults key-value store and associates it
  /// with [key].
  Future<void> setDouble(
    String key,
    double value, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('setDouble() has not been implemented.');
  }

  /// Stores [value] in the user defaults key-value store and associates it
  /// with [key].
  Future<void> setString(
    String key,
    String value, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('setString() has not been implemented.');
  }

  /// Removes the value associated with [key] from the user defaults.
  Future<bool> remove(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('removeItem() has not been implemented.');
  }

  /// Returns true if the key is present, false otherwise.
  Future<bool> contains(
    String key, [
    String? appGroup,
  ]) async {
    throw UnimplementedError('contains() has not been implemented.');
  }
}
