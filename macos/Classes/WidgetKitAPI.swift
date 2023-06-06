// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol WidgetKitAPI {
  /// Reloads the timelines for all configured widgets belonging to the
  /// containing app.
  func reloadAllTimelines() throws
  /// Reloads the timelines for all widgets of a particular kind.
  /// - Parameter [kind]: A string that identifies the widget and matches the
  ///   value you used when you created the widget's configuration.
  func reloadTimelines(kind: String) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class WidgetKitAPISetup {
  /// The codec used by WidgetKitAPI.
  /// Sets up an instance of `WidgetKitAPI` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: WidgetKitAPI?) {
    /// Reloads the timelines for all configured widgets belonging to the
    /// containing app.
    let reloadAllTimelinesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.WidgetKitAPI.reloadAllTimelines", binaryMessenger: binaryMessenger)
    if let api = api {
      reloadAllTimelinesChannel.setMessageHandler { _, reply in
        do {
          try api.reloadAllTimelines()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      reloadAllTimelinesChannel.setMessageHandler(nil)
    }
    /// Reloads the timelines for all widgets of a particular kind.
    /// - Parameter [kind]: A string that identifies the widget and matches the
    ///   value you used when you created the widget's configuration.
    let reloadTimelinesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.WidgetKitAPI.reloadTimelines", binaryMessenger: binaryMessenger)
    if let api = api {
      reloadTimelinesChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let kindArg = args[0] as! String
        do {
          try api.reloadTimelines(kind: kindArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      reloadTimelinesChannel.setMessageHandler(nil)
    }
  }
}
