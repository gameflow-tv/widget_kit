import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_kit_plugin/widget_kit_plugin.dart';

void main() {
  const channel = MethodChannel('widget_kit');
  final methodChannelWidgetKit = MethodChannelWidgetKit();

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('reloadAllTimelines', () async {
    await methodChannelWidgetKit.reloadAllTimelines();
  });

  test('reloadTimelines', () async {
    await methodChannelWidgetKit.reloadTimelines('kind');
  });
}
