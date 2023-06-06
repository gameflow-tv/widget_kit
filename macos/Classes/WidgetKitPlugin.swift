import Cocoa
import FlutterMacOS
import WidgetKit

extension FlutterError: Error {}

var _appGroup: String?

class WidgetKitHandler: NSObject, WidgetKitAPI {
    func reloadAllTimelines() throws {
        if #available(macOS 11.0, *) {
#if arch(arm64) || arch(i386) || arch(x86_64)
            WidgetCenter.shared.reloadAllTimelines()
#endif
        }
        return
    }
    
    func reloadTimelines(kind: String) throws {
        if #available(macOS 11.0, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: kind)
        }
        return
    }
}

class UserDefaultsHandler: NSObject, UserDefaultsAPI {
    private func getUserDefaults(appGroup: String?) throws -> UserDefaults{
        if(_appGroup == nil && appGroup == nil) {
            throw FlutterError(
                code: "NO_APP_GROUP",
                message: "No appGroup was passed, and no default App Group is set",
                details: "Either set a default App Group, or pass a valid App Group identifier to the method"
            )
        } else {
            let sharedDefaults = UserDefaults.init(suiteName: appGroup ?? _appGroup)
            if (sharedDefaults == nil) {
                throw FlutterError(
                    code: "noSharedDefaults",
                    message: "Shared defaults are not available for the given App Group",
                    details: "Check if the appGroup parameter is correct, and that the host application has the correct permissions enabled."
                )
            }
            return sharedDefaults!
        }
    }
    
    func setAppGroup(appGroup: String) throws {
        _appGroup = appGroup
    }
    
    func get(key: String, appGroup: String?) throws -> Any? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.object(forKey: key)
    }
    
    func getString(key: String, appGroup: String?) throws -> String? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.string(forKey: key)
    }
    
    func getBool(key: String, appGroup: String?) throws -> Bool? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.bool(forKey: key)
    }
    
    func getInt(key: String, appGroup: String?) throws -> Int64? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return Int64(defs.integer(forKey: key))
    }
    
    func getDouble(key: String, appGroup: String?) throws -> Double? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.double(forKey: key)
    }
    
    func getMap(key: String, appGroup: String?) throws -> [AnyHashable : Any?]? {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.dictionary(forKey: key)
    }
    
    func set(key: String, value: Any, appGroup: String?) throws {
        let defs = try getUserDefaults(appGroup: appGroup)
        defs.set(value, forKey: key)
    }
    
    func setString(key: String, value: String, appGroup: String?) throws {
        return try set(key: key, value: value, appGroup: appGroup)
    }
    
    func setBool(key: String, value: Bool, appGroup: String?) throws {
        return try set(key: key, value: value, appGroup: appGroup)
    }
    
    func setInt(key: String, value: Int64, appGroup: String?) throws {
        return try set(key: key, value: value, appGroup: appGroup)
    }
    
    func setDouble(key: String, value: Double, appGroup: String?) throws {
        return try set(key: key, value: value, appGroup: appGroup)
    }
    
    func setMap(key: String, value: [AnyHashable : Any?], appGroup: String?) throws {
        return try set(key: key, value: value, appGroup: appGroup)
    }
    
    func remove(key: String, appGroup: String?) throws {
        let defs = try getUserDefaults(appGroup: appGroup)
        defs.removeObject(forKey: key)
    }
    
    func contains(key: String, appGroup: String?) throws -> Bool {
        let defs = try getUserDefaults(appGroup: appGroup)
        return defs.object(forKey: key) != nil
    }
}

public class WidgetKitPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let udHandler = UserDefaultsHandler()
        UserDefaultsAPISetup.setUp(binaryMessenger: registrar.messenger, api: udHandler)
        
        let wkHandler = WidgetKitHandler()
        WidgetKitAPISetup.setUp(binaryMessenger: registrar.messenger, api: wkHandler)
    }
}
