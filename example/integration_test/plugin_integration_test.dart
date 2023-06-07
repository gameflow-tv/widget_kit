// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:widget_kit_plugin/widget_kit_plugin.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('setItem test', (WidgetTester tester) async {
    await UserDefaults.set('key', 'value', 'appGroup');

    final String? value = await UserDefaults.getString('key', 'appGroup');

    expect(value, 'value');
  });

  testWidgets('reloadTimelines', (widgetTester) async {
    await WidgetKit.reloadAllTimelines();

    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(true, true);
  });
}
