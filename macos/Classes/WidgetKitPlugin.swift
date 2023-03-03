import Cocoa
import FlutterMacOS
import WidgetKit

public class WidgetKitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Register the widget kit channel
    let wkChannel = FlutterMethodChannel(name: "widget_kit", binaryMessenger: registrar.messenger)

    // Register the user defaults channel
    let udChannel = FlutterMethodChannel(
      name: "user_defaults", binaryMessenger: registrar.messenger)

    let instance = WidgetKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: wkChannel)
    registrar.addMethodCallDelegate(instance, channel: udChannel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "reloadAllTimelines":
      if #available(macOS 11.0, *) {
        #if arch(arm64) || arch(i386) || arch(x86_64)
          WidgetCenter.shared.reloadAllTimelines()
        #endif
      }
      result(nil)
      return
    case "reloadTimelines":
      if #available(macOS 11.0, *) {
        if let args = call.arguments as? [String: Any],
          let ofKind = args["ofKind"] as? String
        {
          WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
        }
      }
      result(nil)
      return
    case "get":
      if let args = call.arguments as? [String: Any],
        let appGroup = args["appGroup"] as? String,
        let key = args["key"] as? String
      {

        var sharedDefaults: UserDefaults? = nil

        if appGroup != "" {
          sharedDefaults = UserDefaults.init(suiteName: appGroup)
        }

        if sharedDefaults == nil {
          result(
            FlutterError(
              code: "noSharedDefaults",
              message: "Shared defaults are not available",
              details: "Check if the appGroup parameter is valid"
            )
          )
          return
        }

        let value = sharedDefaults?.value(forKey: key)

        result(value)
        return
      }

      result(nil)
      return
    case "set":
      if let args = call.arguments as? [String: Any],
        let appGroup = args["appGroup"] as? String,
        let key = args["key"] as? String,
        let value = args["value"]
      {

        var sharedDefaults: UserDefaults? = nil

        if appGroup != "" {
          sharedDefaults = UserDefaults.init(suiteName: appGroup)
        }

        if sharedDefaults == nil {
          result(nil)
          return
        }

        sharedDefaults?.setValue(value, forKey: key)

        result(value)
        return
      }

      result(nil)
      return
    case "remove":
      if let args = call.arguments as? [String: Any],
        let appGroup = args["appGroup"] as? String,
        let key = args["key"] as? String
      {

        var sharedDefaults: UserDefaults? = nil

        if appGroup != "" {
          sharedDefaults = UserDefaults.init(suiteName: appGroup)
        }

        if sharedDefaults == nil {
          result(nil)
          return
        }

        sharedDefaults?.removeObject(forKey: key)

        result(true)
        return
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
