import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_kit_plugin/user_defaults/method_channel.dart';

void main() {
  const channel = MethodChannel('user_defaults');
  final methodChannelUserDefaults = MethodChannelUserDefaults();
  final cache = <String, dynamic>{};

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'get':
          return cache[methodCall.arguments['key']];
        case 'remove':
          try {
            cache.remove(methodCall.arguments['key']);
            return true;
          } catch (e) {
            return false;
          }
        case 'set':
          cache[methodCall.arguments['key']] = methodCall.arguments['value'];
          return null;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('set/get dynamic', () async {
    await methodChannelUserDefaults.set('key', 'value', 'appGroup');
    expect(await methodChannelUserDefaults.get('key', 'appGroup'), 'value');
  });

  test('set/get bool', () async {
    await methodChannelUserDefaults.setBool('key', true, 'appGroup');
    expect(await methodChannelUserDefaults.getBool('key', 'appGroup'), true);
  });

  test('set/get double', () async {
    await methodChannelUserDefaults.setDouble('key', 1.0, 'appGroup');
    expect(await methodChannelUserDefaults.getDouble('key', 'appGroup'), 1.0);
  });

  test('set/get int', () async {
    await methodChannelUserDefaults.setInt('key', 1, 'appGroup');
    expect(await methodChannelUserDefaults.getInt('key', 'appGroup'), 1);
  });

  test('set/get string', () async {
    await methodChannelUserDefaults.setString('key', 'value', 'appGroup');
    expect(
        await methodChannelUserDefaults.getString('key', 'appGroup'), 'value');
  });

  test('remove', () async {
    expect(await methodChannelUserDefaults.remove('key', 'appGroup'), true);
  });

  test('contains', () async {
    expect(
      await methodChannelUserDefaults.contains('nonexistent', 'appGroup'),
      false,
    );
  });
}
