import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_kit_plugin/api/widget_kit.dart';
import 'widget_kit_test.mocks.dart';

@GenerateMocks([WidgetKitAPI])
void main() {
  final widgetKit = MockWidgetKitAPI();

  TestWidgetsFlutterBinding.ensureInitialized();

  test('reloadAllTimelines', () async {
    when(widgetKit.reloadAllTimelines()).thenAnswer((_) async {
      return;
    });
    await widgetKit.reloadAllTimelines();
  });

  test('reloadTimelines', () async {
    when(widgetKit.reloadTimelines('kind')).thenAnswer((_) async {
      return;
    });
    await widgetKit.reloadTimelines('kind');
  });
}
