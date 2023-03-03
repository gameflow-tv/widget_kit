import 'package:flutter_test/flutter_test.dart';
import 'package:widget_kit_plugin/widget_kit_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWidgetKitPlatform
    with MockPlatformInterfaceMixin
    implements WidgetKitPlatform {
  @override
  Future<void> reloadAllTimelines() async {}

  @override
  Future<void> reloadTimelines(String kind) async {}
}

void main() {
  final WidgetKitPlatform initialPlatform = WidgetKitPlatform.instance;

  test('$MethodChannelWidgetKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWidgetKit>());
  });

  test('smoke test', () async {
    MockWidgetKitPlatform fakePlatform = MockWidgetKitPlatform();
    WidgetKitPlatform.instance = fakePlatform;
  });

  test('reloadAllTimelines', () async {
    MockWidgetKitPlatform fakePlatform = MockWidgetKitPlatform();
    WidgetKitPlatform.instance = fakePlatform;

    await WidgetKit.reloadAllTimelines();
  });

  test('reloadTimelines', () async {
    MockWidgetKitPlatform fakePlatform = MockWidgetKitPlatform();
    WidgetKitPlatform.instance = fakePlatform;

    await WidgetKit.reloadTimelines('kind');
  });
}
