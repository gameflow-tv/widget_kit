import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel.dart';

abstract class WidgetKitPlatform extends PlatformInterface {
  /// Constructs a WidgetKitPlatform.
  WidgetKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static WidgetKitPlatform _instance = MethodChannelWidgetKit();

  /// The default instance of [WidgetKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelWidgetKit].
  static WidgetKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WidgetKitPlatform] when
  /// they register themselves.
  static set instance(WidgetKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> reloadAllTimelines() async {
    throw UnimplementedError('reloadAllTimelines() has not been implemented.');
  }

  Future<void> reloadTimelines(
    String kind,
  ) async {
    throw UnimplementedError('reloadTimelines() has not been implemented.');
  }
}
