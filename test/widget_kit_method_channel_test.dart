import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_kit_plugin/widget_kit_plugin.dart';

void main() {
  const channel = MethodChannel('widget_kit');
  final methodChannelWidgetKit = MethodChannelWidgetKit();

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('reloadAllTimelines', () async {
    await methodChannelWidgetKit.reloadAllTimelines();
  });

  test('reloadTimelines', () async {
    await methodChannelWidgetKit.reloadTimelines('kind');
  });
}
