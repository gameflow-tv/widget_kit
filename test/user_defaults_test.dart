import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_kit_plugin/api/user_defaults.dart';
import 'user_defaults_test.mocks.dart';

@GenerateMocks([UserDefaultsAPI])
void main() {
  final userDefaults = MockUserDefaultsAPI();
  final cache = <String, dynamic>{};

  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() => cache.clear());

  test('set/get dynamic', () async {
    when(userDefaults.set('key', 'value', 'appGroup')).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.get('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    await userDefaults.set('key', 'value', 'appGroup');
    expect(await userDefaults.get('key', 'appGroup'), 'value');
  });

  test('set/get bool', () async {
    when(userDefaults.setBool('key', true, any)).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.getBool('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    await userDefaults.setBool('key', true, 'appGroup');

    expect(await userDefaults.getBool('key', 'appGroup'), true);
  });

  test('set/get double', () async {
    when(userDefaults.setDouble('key', 1.0, any)).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.getDouble('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    await userDefaults.setDouble('key', 1.0, 'appGroup');

    expect(await userDefaults.getDouble('key', 'appGroup'), 1.0);
  });

  test('set/get int', () async {
    when(userDefaults.setInt('key', 1, any)).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.getInt('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    await userDefaults.setInt('key', 1, 'appGroup');

    expect(await userDefaults.getInt('key', 'appGroup'), 1);
  });

  test('set/get string', () async {
    when(userDefaults.setString('key', 'value', any)).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.getString('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    await userDefaults.setString('key', 'value', 'appGroup');

    expect(await userDefaults.getString('key', 'appGroup'), 'value');
  });

  test('remove', () async {
    when(userDefaults.set('key', 'value', 'appGroup')).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.get('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    when(userDefaults.remove('key', 'appGroup')).thenAnswer((_) async {
      cache.remove(_.positionalArguments[0]);
    });

    await userDefaults.set('key', 'value', 'appGroup');
    expect(await userDefaults.get('key', 'appGroup'), 'value');

    await userDefaults.remove('key', 'appGroup');
    expect(await userDefaults.get('key', 'appGroup'), null);
  });

  test('contains', () async {
    when(userDefaults.set('key', 'value', 'appGroup')).thenAnswer((_) async {
      cache[_.positionalArguments[0]] = _.positionalArguments[1];
    });

    when(userDefaults.get('key', 'appGroup')).thenAnswer((_) async {
      return cache[_.positionalArguments[0]];
    });

    when(userDefaults.contains('key', 'appGroup')).thenAnswer((_) async {
      return cache.containsKey(_.positionalArguments[0]);
    });

    expect(await userDefaults.contains('key', 'appGroup'), false);
    await userDefaults.set('key', 'value', 'appGroup');
    expect(await userDefaults.contains('key', 'appGroup'), true);
  });
}
