import 'package:flutter_test/flutter_test.dart';
import 'package:widget_kit/widget.kit.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUserDefaultsPlatform
    with MockPlatformInterfaceMixin
    implements UserDefaultsPlatform {
  final _mockPrefs = <String, dynamic>{};

  @override
  Future<dynamic> get(String key, String appGroup) async {
    return _mockPrefs[key];
  }

  @override
  Future<bool> remove(String key, String appGroup) async {
    try {
      _mockPrefs.remove(key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> set(String key, value, String appGroup) async {
    _mockPrefs[key] = value;
  }

  @override
  Future<bool> contains(String key, String appGroup) async {
    return _mockPrefs.containsKey(key);
  }

  @override
  Future<bool?> getBool(String key, String appGroup) async {
    return await get(key, appGroup) as bool?;
  }

  @override
  Future<double?> getDouble(String key, String appGroup) async {
    return await get(key, appGroup) as double?;
  }

  @override
  Future<int?> getInt(String key, String appGroup) async {
    return await get(key, appGroup) as int?;
  }

  @override
  Future<String?> getString(String key, String appGroup) async {
    return await get(key, appGroup) as String?;
  }

  @override
  Future<void> setBool(String key, bool value, String appGroup) async {
    return set(key, value, appGroup);
  }

  @override
  Future<void> setDouble(String key, double value, String appGroup) async {
    return set(key, value, appGroup);
  }

  @override
  Future<void> setInt(String key, int value, String appGroup) async {
    return set(key, value, appGroup);
  }

  @override
  Future<void> setString(String key, String value, String appGroup) async {
    return set(key, value, appGroup);
  }
}

void main() {
  final UserDefaultsPlatform initialPlatform = UserDefaultsPlatform.instance;

  test('$MethodChannelUserDefaults is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUserDefaults>());
  });

  test('smoke test', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;
  });

  test('set/get dynamic value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.set('key', 'value', 'appGroup');
    final String? value = await UserDefaults.get('key', 'appGroup');

    expect(value, 'value');
  });

  test('set/get string value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.setString('key', 'value', 'appGroup');
    final String? value = await UserDefaults.getString('key', 'appGroup');

    expect(value, 'value');
  });

  test('set/get bool value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.setBool('key', true, 'appGroup');
    final bool? value = await UserDefaults.getBool('key', 'appGroup');

    expect(value, true);
  });

  test('set/get int value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.setInt('key', 1, 'appGroup');
    final int? value = await UserDefaults.getInt('key', 'appGroup');

    expect(value, 1);
  });

  test('set/get double value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.setDouble('key', 1.0, 'appGroup');
    final double? value = await UserDefaults.getDouble('key', 'appGroup');

    expect(value, 1.0);
  });

  test('remove value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.set('key', 'value', 'appGroup');
    final bool removed = await UserDefaults.remove('key', 'appGroup');

    expect(removed, true);
  });

  test('contains value', () async {
    MockUserDefaultsPlatform fakePlatform = MockUserDefaultsPlatform();
    UserDefaultsPlatform.instance = fakePlatform;

    await UserDefaults.set('key', 'value', 'appGroup');
    final bool contains = await UserDefaults.contains('key', 'appGroup');

    expect(contains, true);
  });
}
