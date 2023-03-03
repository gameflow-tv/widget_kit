import 'platform_interface.dart';

class WidgetKit {
  static Future<void> reloadAllTimelines() async {
    return WidgetKitPlatform.instance.reloadAllTimelines();
  }

  static Future<void> reloadTimelines(
    String kind,
  ) async {
    return WidgetKitPlatform.instance.reloadTimelines(kind);
  }
}
