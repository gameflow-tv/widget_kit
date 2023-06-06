import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_interface.dart';

/// An implementation of [UserDefaultsPlatform] that uses method channels.
class MethodChannelUserDefaults implements UserDefaultsPlatform {
  MethodChannelUserDefaults([this._appGroup]);

  // Internal app group used as a fallback if no app group is provided.
  final String? _appGroup;

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('user_defaults');

  @override
  Future<dynamic> get(
    String key, [
    String? appGroup,
  ]) async {
    assert(_appGroup != null || appGroup != null);
    return await methodChannel.invokeMethod('get', {
      'key': key,
      'appGroup': appGroup ?? _appGroup,
    });
  }

  @override
  Future<bool?> getBool(String key, [String? appGroup]) async {
    return await get(key, appGroup ?? _appGroup) as bool?;
  }

  @override
  Future<double?> getDouble(String key, [String? appGroup]) async {
    return await get(key, appGroup ?? _appGroup) as double?;
  }

  @override
  Future<int?> getInt(String key, [String? appGroup]) async {
    return await get(key, appGroup ?? _appGroup) as int?;
  }

  @override
  Future<String?> getString(String key, [String? appGroup]) async {
    return await get(key, appGroup ?? _appGroup) as String?;
  }

  @override
  Future<void> set(
    String key,
    dynamic value, [
    String? appGroup,
  ]) async {
    assert(_appGroup != null || appGroup != null);
    await methodChannel.invokeMethod('set', {
      'key': key,
      'value': value,
      'appGroup': appGroup ?? _appGroup,
    });
  }

  @override
  Future<bool> remove(
    String key, [
    String? appGroup,
  ]) async {
    assert(_appGroup != null || appGroup != null);
    return await methodChannel.invokeMethod('remove', {
      'key': key,
      'appGroup': appGroup ?? _appGroup,
    });
  }

  @override
  Future<bool> contains(
    String key, [
    String? appGroup,
  ]) async {
    return await get(key, appGroup ?? _appGroup) != null;
  }

  @override
  Future<void> setBool(
    String key,
    bool value, [
    String? appGroup,
  ]) {
    return set(key, value, appGroup ?? _appGroup);
  }

  @override
  Future<void> setDouble(
    String key,
    double value, [
    String? appGroup,
  ]) {
    return set(key, value, appGroup ?? _appGroup);
  }

  @override
  Future<void> setInt(
    String key,
    int value, [
    String? appGroup,
  ]) {
    return set(key, value, appGroup ?? _appGroup);
  }

  @override
  Future<void> setString(
    String key,
    String value, [
    String? appGroup,
  ]) {
    return set(key, value, appGroup ?? _appGroup);
  }
}
