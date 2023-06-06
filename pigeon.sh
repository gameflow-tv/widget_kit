# UserDefaults for iOS
dart run pigeon \
    --input api/user_defaults.dart \
    --dart_out lib/api/user_defaults.dart \
    --swift_out ios/Classes/UserDefaultsAPI.swift

# UserDefaults for macOS
dart run pigeon \
    --input api/user_defaults.dart \
    --dart_out lib/api/user_defaults.dart \
    --swift_out macos/Classes/UserDefaultsAPI.swift

# WidgetKit for iOS
dart run pigeon \
    --input api/widget_kit.dart \
    --dart_out lib/api/widget_kit.dart \
    --swift_out ios/Classes/WidgetKitAPI.swift

# WidgetKit for macOS
dart run pigeon \
    --input api/widget_kit.dart \
    --dart_out lib/api/widget_kit.dart \
    --swift_out macos/Classes/WidgetKitAPI.swift
