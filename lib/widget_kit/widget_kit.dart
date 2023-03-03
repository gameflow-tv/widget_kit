import 'platform_interface.dart';

/// Surface level API for the WidgetKit plugin.
class WidgetKit {
  /// Reloads the timelines for all configured widgets belonging to the
  /// containing app.
  static Future<void> reloadAllTimelines() async {
    return WidgetKitPlatform.instance.reloadAllTimelines();
  }

  /// Reloads the timelines for all widgets of a particular kind.
  /// - Parameter [kind]: A string that identifies the widget and matches the
  ///   value you used when you created the widget's configuration.
  static Future<void> reloadTimelines(
    String kind,
  ) async {
    return WidgetKitPlatform.instance.reloadTimelines(kind);
  }
}
