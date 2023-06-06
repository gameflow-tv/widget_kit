import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class WidgetKitAPI {
  /// Reloads the timelines for all configured widgets belonging to the
  /// containing app.
  void reloadAllTimelines();

  /// Reloads the timelines for all widgets of a particular kind.
  /// - Parameter [kind]: A string that identifies the widget and matches the
  ///   value you used when you created the widget's configuration.
  void reloadTimelines(String kind);
}
