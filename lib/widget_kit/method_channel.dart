import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_interface.dart';

/// An implementation of [WidgetKitPlatform] that uses method channels.
class MethodChannelWidgetKit implements WidgetKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('widget_kit');

  @override
  Future<void> reloadAllTimelines() async {
    await methodChannel.invokeMethod('reloadAllTimelines');
  }

  @override
  Future<void> reloadTimelines(
    String ofKind,
  ) async {
    await methodChannel.invokeMethod('reloadTimelines', {
      'ofKind': ofKind,
    });
  }
}
